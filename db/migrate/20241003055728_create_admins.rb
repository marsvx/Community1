class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins, id:false do |t|
      t.string :username, null:false, limit:15, primary_key:true
      t.string :email, null:false, limit:255
      t.string :firstName, null:false, limit:150
      t.string :protectedPasswd, null:false, limit:80
    end
    add_index :users, :email, unique: true
  end
end
