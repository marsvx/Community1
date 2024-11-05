class Classification < ApplicationRecord
    belongs_to :organization, foreign_key: :organizationID_id, primary_key: :organizationId, optional: false
    belongs_to :category, foreign_key: :categoryabbr_id, primary_key: :abbv, optional: false

    validates :organizationID_id, presence: true
    validates :categoryabbr_id, presence: true
end
