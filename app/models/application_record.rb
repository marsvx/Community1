class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  
  private

  def downcase_username
    self.username = username.downcase if respond_to?(:username) && username.present?
  end

  def downcase_email
    self.email = email.downcase if respond_to?(:email) && email.present?
  end

  def uppercase_abbv
    self.abbv = abbv.upcase if respond_to?(:abbv) && abbv.present?
  end

  def titleize_cat_name
    self.cat_name = cat_name.titleize if respond_to?(:cat_name) && cat_name.present?
  end
end
