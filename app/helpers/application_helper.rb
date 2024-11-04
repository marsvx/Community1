module ApplicationHelper
  def current_page_without_header?
    controller_name == 'asession' ||
    controller_name == 'admins' ||
    controller_name == 'categories' ||
    controller_name == 'organizations'
  end
  
  def formatPhoneNumber(number)
    return number unless number.present?
    number.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end
end
