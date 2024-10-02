class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events, id: false do |t|  # Disabling default `id` column
      t.serial :eventid, primary_key: true  # `eventid` as SERIAL PRIMARY KEY
      
      t.string :organizationID, limit: 255  # organizationID is a string with a limit of 255 characters
      t.string :userID, limit: 15           # userID with a limit of 15 characters
      t.string :title, limit: 150, null: false  # Title must be present, max 150 characters
      t.date :eventDate, null: false        # Event date
      t.time :eventTime, null: false        # Event time
      t.text :eventDescription, null: false # Event description
      t.string :street, limit: 255, null: false  # Street address
      t.string :city, limit: 100, null: false    # City name
      t.string :eventState, limit: 2, null: false, default: 'CO'  # Limiting state to "CO"
      t.integer :zipcode, null: false       # Zipcode
      t.boolean :isVirtual, null: false     # Boolean to indicate if the event is virtual
      t.string :meetingLink, limit: 2050    # Optional meeting link for virtual events
      t.boolean :eventstatus, null: false   # Event status (boolean, required because only approved events will be displayed)
      t.string :adminID, limit: 15          # Admin ID with a limit of 15 characters

      # Foreign key relationships
      t.references :organization, foreign_key: { to_table: :organizations, primary_key: :email }, type: :string
      t.references :user, foreign_key: { to_table: :users, primary_key: :username }, type: :string
      t.references :admin, foreign_key: { to_table: :admins, primary_key: :username }, type: :string

      t.timestamps
    end
  end
end
