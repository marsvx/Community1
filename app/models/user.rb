class User < ApplicationRecord
  has_secure_password

  before_save :downcase_email
  before_save :downcase_username, if: :new_record?

  before_destroy :prevent_base_user_destruction
  before_update :prevent_base_user_changes

  # Validation for a valid email format
  validates :email, format: { with: Devise.email_regexp, message: "Please use a valid email" }

  # Validations for username and email
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  # Validation for the presence of required fields
  validates :first_name, presence: true
  validates :age_range, presence: true  # Ensure age_range is present
  validates :zipcode, presence: true     # Ensure zipcode is present
  validates :password, presence: true, length: { minimum: 6 }  # Ensure password has a minimum length

  private

  def downcase_email
    self.email = email.downcase
  end

  def downcase_username
    self.username = username.downcase
  end

  def prevent_base_user_destruction
    if username == "admin"
      errors.add(:base, "This user cannot be deleted.")
      throw(:abort)
    end
  end

  def prevent_base_user_changes
    if username == "admin"
      if email_changed? || first_name_changed?
        errors.add(:base, "Only the password can be changed for this user.")
        throw(:abort)
      end
    end
  end
end
