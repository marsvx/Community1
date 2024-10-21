class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  
  private

  def downcase_username
    self.username = username.downcase
  end

  def downcase_email
    self.email = email.downcase
  end
end
