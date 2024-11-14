class RemoveNotNullConstraintFromAdminUsername < ActiveRecord::Migration[7.1]
  def change
    change_column_null :questions, :admin_username, true
    change_column_null :answers, :admin_username, true
  end
end
