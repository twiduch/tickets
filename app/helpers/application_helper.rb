module ApplicationHelper

  def nav_link(text, path)
    class_name = current_page?(path) ? 'current' : nil
    link_to text, path, :class => class_name
  end
end
