class CreateQuestionAnswerRels < ActiveRecord::Migration[7.1]
  def change
    create_table :question_answer_rels do |t|
      t.text :body

      t.timestamps
    end
  end
end
