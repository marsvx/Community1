class Event < ApplicationRecord
    belongs_to :organization, optional: true
    belongs_to :user
    belongs_to :admin

    def location
      if isVirtual
        "Virtual"
      else
        "#{street} #{city}, #{eventState}. #{zipcode}"
      end
    end

    def formatted_event_date
      eventDate.strftime("%B %d, %Y") if eventDate
    end
end
