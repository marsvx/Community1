class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations, primary_key: :organizationId do |t|
      t.string :org_name, null: false, limit: 255
      t.string :street, null: false, limit: 255
      t.string :city, null: false, limit: 100
      t.string :org_state, null: false, limit: 2, default: 'CO'
      t.integer :zipcode, null: false
      t.string :email, null: false, limit: 255
      t.string :phoneNumber, limit: 15
      t.string :webLink, limit: 2050
      t.text :servicesSummary, null: false
      t.decimal :avgStarValue, precision: 2, scale: 1
      t.string :admin_username, null: false #added for accountability purposes
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' } # Note: This is a Rails shortcut that automatically creates two columns in the table. SO COOL! LOL, eeven if current_timestamp is not added it will do it
    end
  end
end
