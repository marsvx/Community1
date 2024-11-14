class Question < ApplicationRecord
    self.primary_key = 'questionID'
    has_many :surveys, foreign_key: :questionID_id, dependent: :destroy
  end
