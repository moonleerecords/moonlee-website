module ApplicationHelper
  def navigation_link(link_text, link_path)
    class_name = request.fullpath.start_with?(link_path) ? 'active' : ''

    content_tag(:li) do
      link_to link_text, link_path, class: class_name
    end
  end
end
