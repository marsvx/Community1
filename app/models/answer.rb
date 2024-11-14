class Answer < ApplicationRecord
    self.primary_key = 'answerID'
    has_many :question_answer_rels, foreign_key: "answer_ID"
    has_many :questions, through: :question_answer_rels
end
