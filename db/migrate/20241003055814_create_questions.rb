class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions, primary_key: :questionID do |t|
      t.string :question, null:false, limit:150

      # Foreign key relationships
      t.references :admin, foreign_key: { to_table: :admins, primary_key: :username}, type: :string
    end
  end
end
