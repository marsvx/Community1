class Question < ApplicationRecord
  has_many :question_answer_rels
  has_many :answers, through: :question_answer_rels
  belongs_to :survey
  end
  