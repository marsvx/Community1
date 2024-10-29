class CreateClassifications < ActiveRecord::Migration[7.1]
  def change
    create_table :classifications, primary_key: :associationID do |t|
      t.references :organizationID, foreign_key: {to_table: :organizations, primary_key: :email}, type: :string
      t.references :categoryabbr, foreign_key: {to_table: :categories, primary_key: :abbv}, type: :string
      t.timestamps
    end
  end
end
