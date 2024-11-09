class RenameQuestionAndAnswerIDsInQuestionAnswerRels < ActiveRecord::Migration[6.1]
  def change
    rename_column :question_answer_rels, :question_ID, :question_id
    rename_column :question_answer_rels, :answer_ID, :answer_id
  end
end
