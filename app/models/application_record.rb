class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  
  private

  def downcase_username
    self.username = username.downcase if respond_to?(:username) && username.present?
  end

  def downcase_email
    self.email = email.downcase if respond_to?(:email) && email.present?
  end
end
