class Event < ApplicationRecord
    belongs_to :organization, optional: true
    belongs_to :user, foreign_key: :user_id, primary_key: :username, optional: false
    belongs_to :admin, class_name: 'Admin', foreign_key: :admin_id, primary_key: :username, optional: true

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
