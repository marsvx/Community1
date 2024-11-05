class Review < ApplicationRecord
    belongs_to :organization
    belongs_to :user
    belongs_to :admin

    after_save :update_organization_avg_start_value
    after_destroy :update_organization_avg_start_value

    private
    
    def update_organization_avg_start_value
        avg_startValue = organization.reviews.where(reviewStatus: true).average(:startValue) || 0
        organization.update(avg_startValue: avg_startValue)
    end
end
