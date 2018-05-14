class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project
  before_action :find_task, except: [:new, :create]

  def new
    @task = @project.tasks.new
    render_form
  end

  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      flash[:notice] = 'Task created successfully'
    else
      flash[:error] = 'Task cannot be created.'
    end
  end

  def edit
    render_form
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Task updated successfully'
    else
      flash[:error] = 'Task cannot be updated.'
    end
  end

  def show
    @comment = @task.comments.new()
    render template: '/tasks/show', layout: false
  end

  def destroy
    if @task.destroy
      flash[:notice] = "Task #{@task.name} Deleted successfully"
    else
      flash[:error] = "Task cannot be Deleted - #{@task.errors.full_messages.join(', ')}"
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :priority, :deadline, :status)
  end

  def find_project
    @project = current_user.projects.find(params[:project_id])
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end

  def render_form
    respond_to do |format|
      format.js { render partial: '/tasks/form', layout: false }
    end
  end

end
