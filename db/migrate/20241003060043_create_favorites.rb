class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites, primary_key: :favoriteID do |t|
      t.references :userID, foreign_key: {to_table: :users, primary_key: :username}, type: :string
      t.references :organizationID, foreign_key: {to_table: :organizations, primary_key: :organizationId}, type: :integer
      t.timestamps
    end
  end
end
