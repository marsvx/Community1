class Event < ApplicationRecord
    belongs_to :organization
    belongs_to :user
    belongs_to :admin
end
