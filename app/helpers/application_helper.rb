module ApplicationHelper
  def active_menu?(page_name)
    ' class="active"'.html_safe if params[:controller] == page_name
  end
end
