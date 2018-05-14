module TaskHelper
  def task_errors
    content_tag :div do
      @task.errors.full_messages.each do |error|
        concat content_tag :li, error
      end
    end
  end
end
