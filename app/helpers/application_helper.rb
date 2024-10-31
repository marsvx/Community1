module ApplicationHelper
  def current_page_without_header?
    controller_name == 'asession' ||
    controller_name == 'admins' ||
    controller_name == 'categories'
  end
end
