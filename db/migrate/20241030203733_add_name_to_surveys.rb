class AddNameToSurveys < ActiveRecord::Migration[7.1]
  def change
    add_column :surveys, :name, :string
  end
end
