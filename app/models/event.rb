class Event < ApplicationRecord
    belongs_to :organization
    belongs_to :user
    belongs_to :admin

    def location
        "#{street}, #{city}, #{eventState}, #{zipcode}"
      end
end
