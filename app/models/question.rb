class Question < ApplicationRecord
    has_many :surveys, foreign_key: :questionID_id
  end
  