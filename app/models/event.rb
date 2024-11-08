class Event < ApplicationRecord
    belongs_to :organization, optional: true
    belongs_to :user, foreign_key: :user_id, primary_key: :username, optional: false
    belongs_to :admin, class_name: 'Admin', foreign_key: :admin_id, primary_key: :username, optional: true
    after_update :admin_changes

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

    def approved?
      eventstatus
    end 

    def self.approved_events
      where(eventstatus: true)
    end

    private
    
    def admin_changes
      if saved_change_to_eventstatus?
        self.admin_id = Current.admin.username
        save
      end
    end
end
