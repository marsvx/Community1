class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories, id:false do |t|
      t.string :abbv, null:false, limit:5, primary_key:true
      t.string :cat_name, null:false, limit:100
    end
  end
end
