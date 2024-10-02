class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id:false do |t|
      t.string :username, null: false, limit: 15, primary_key: true
      t.string :email, null: false, limit: 255, unique: true
      t.string :firstName, null: false, limit: 150
      t.string :ageRange, null: false, limit: 8
      t.string :hashedPasswd, null: false, limit: 80
      t.integer :zipCode
    end
  end
end