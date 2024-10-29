class AddQuestionIdToQuestionAnswerRel < ActiveRecord::Migration[7.1]
  def change
    add_column :question_answer_rels, :question_ID, :string
  end
end
