class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys, primary_key: :surveyID do |t|
      t.references :userID, foreign_key: {to_table: :users, primary_key: :username}, type: :string
      t.references :questionID, foreign_key: {to_table: :questions, primary_key: :questionID}, type: :integer
      t.string :answer, null:true, limit:255
      t.timestamps #automatically tracks when created and when updated
    end
  end
end
