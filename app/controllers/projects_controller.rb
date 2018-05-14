class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, except: [:index, :new, :create]

  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.new()
    render_form
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save(params[:project])
      flash[:notice] = 'Project created successfully'
    else
      flash[:error] = 'Project cannot be created.'
    end
  end

  def edit
    render_form
  end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Project updated successfully'
    else
      flash[:error] = 'Project cannot be updated.'
    end
  end

  def show
    @tasks = @project.tasks
  end

  def destroy
    if @project.destroy
      flash[:notice] = "Project #{@project.name} Deleted successfully"
    else
      flash[:error] = "Project cannot be Deleted - #{@project.errors.full_messages.join(', ')}"
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def find_project
    @project = current_user.projects.find(params[:id])
  end

  def render_form
    respond_to do |format|
      format.js { render template: '/projects/form.js.erb' }
    end
  end

end
