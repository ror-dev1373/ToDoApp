class CommentsController < ApplicationController
  before_action :find_task

  def create
    @comment = @task.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment created successfully'
    else
      flash[:error] = 'Comment cannot be created.'
    end
  end

  def destroy
    @comment = @task.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment Deleted successfully"
    else
      flash[:error] = "Comment cannot be Deleted - #{@comment.errors.full_messages.join(', ')}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :ref_file)
  end

  def find_task
    @task = Task.find(params[:task_id])
  end
end
