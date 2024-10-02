class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.bigint :organization_id, null: true  # Nullable foreign key
      t.string :username, null: true  # Nullable foreign key
      t.string :title, null: false
      t.integer :month, null: false
      t.integer :day, null: false
      t.integer :year, null: false
      t.time :time, null: false
      t.text :description, null: false
      t.string :street, null: true
      t.string :city, null: true
      t.string :state, null: true
      t.boolean :is_virtual, default: false
      t.string :meetinglink, null: true
      t.boolean :status, default: false
      t.bigint :admin_id, null: true  # Nullable foreign key
      t.timestamps
    end
  end
end
