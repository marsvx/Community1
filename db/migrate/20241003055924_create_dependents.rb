class CreateDependents < ActiveRecord::Migration[7.1]
  def change
    create_table :dependents, primary_key: :dependentId do |t|
      t.references :userID, foreign_key: {to_table: :users, primary_key: :username}, type: :string
      t.string :nickname, null:false, limit:50
      t.string :ageRange, null:false, limit:8
      t.timestamps
    end
  end
end
