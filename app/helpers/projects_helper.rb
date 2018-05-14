module ProjectsHelper
  def project_errors
    content_tag :div do
      @project.errors.full_messages.each do |error|
        concat content_tag :li, error
      end
    end
  end
end
