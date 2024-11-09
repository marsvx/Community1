class QuestionAnswerRel < ApplicationRecord
  belongs_to :question, foreign_key: "question_ID"
  belongs_to :answer, foreign_key: "answer_ID"
end
