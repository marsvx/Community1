class SchemaFix < ActiveRecord::Migration[7.1]
  def change
    # fix the organizationID
    change_column :classifications, :organizationID_id, :integer
    change_column :classifications, :organization_id, :integer
    change_column :favorites, :organizationID_id, :integer

    # modify the "organizations" table structure
    change_table :organizations, bulk: true do |t|
      t.remove :primary_key, :id
      t.primary_key :organizationId # Changing primary key
      t.string :email, limit: 255, null: false # Adding email column

    # modify the password
    rename_column :users, :hashedPasswd, :password_digest
    change_column :users, :password_digest, :string, limit: 80, null: false
    end
    end

  end
end
