module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-danger" role="alert">
      <a href="#" data-dismiss="alert" class="close">×</a>
      <ul>
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end
end