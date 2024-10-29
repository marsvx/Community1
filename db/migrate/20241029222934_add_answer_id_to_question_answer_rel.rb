class AddAnswerIdToQuestionAnswerRel < ActiveRecord::Migration[7.1]
  def change
    add_column :question_answer_rels, :answer_ID, :string
  end
end
