class Survey < ApplicationRecord
    belongs_to :user, foreign_key: 'userID_id'
    belongs_to :question, foreign_key: 'questionID_id'
  end
  