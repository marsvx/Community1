# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

puts "Seeding events..."

# Sample event 1: In-person event
Event.create!(
  title: "Community Food Drive",
  eventDate: Date.today + 3,  # Event in 3 days
  eventTime: "09:00",  # 9:00 AM
  eventDescription: "Join us for a community food drive to support local food banks.",
  street: "1234 Main St",
  city: "Denver",
  eventState: "CO",
  zipcode: 80202,
  isVirtual: false,  # In-person event
  meetingLink: nil,  # No meeting link since it's in-person
  eventstatus: true,  # Approved
  organizationID: "org1@example.com",  # Assume org with this email exists
  userID: "user1",  # Assume user with this username exists
  adminID: "admin1"  # Assume admin with this username exists
)

# Sample event 2: Virtual event
Event.create!(
  title: "Virtual Job Fair",
  eventDate: Date.today + 7,  # Event in 7 days
  eventTime: "14:00",  # 2:00 PM
  eventDescription: "A virtual job fair connecting local businesses with job seekers.",
  street: "Virtual",
  city: "Denver",
  eventState: "CO",
  zipcode: 80203,
  isVirtual: true,  # Virtual event
  meetingLink: "https://zoom.us/j/1234567890",  # Virtual meeting link
  eventstatus: true,  # Approved
  organizationID: "org2@example.com",  # Assume org with this email exists
  userID: "user2",  # Assume user with this username exists
  adminID: "admin2"  # Assume admin with this username exists
)

# Sample event 3: Hybrid event
Event.create!(
  title: "Hybrid Workshop: Coding for Beginners",
  eventDate: Date.today + 5,  # Event in 5 days
  eventTime: "18:00",  # 6:00 PM
  eventDescription: "A beginner-friendly coding workshop, available in-person and online.",
  street: "5678 Innovation Dr",
  city: "Boulder",
  eventState: "CO",
  zipcode: 80301,
  isVirtual: true,  # Hybrid event with a virtual option
  meetingLink: "https://zoom.us/j/0987654321",  # Virtual meeting link
  eventstatus: true,  # Approved
  organizationID: "org3@example.com",  # Assume org with this email exists
  userID: "user3",  # Assume user with this username exists
  adminID: "admin3"  # Assume admin with this username exists
)

puts "Finished seeding events!"
