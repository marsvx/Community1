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

puts "Seeding admins..."

# Create some sample admins
Admin.create!(
  username: "admin1",  # Primary key
  email: "admin1@example.com",
  firstName: "Admin",
  protectedPasswd: "adminpass123"
)

Admin.create!(
  username: "admin2",
  email: "admin2@example.com",
  firstName: "SuperAdmin",
  protectedPasswd: "supersecure"
)

puts "Seeding organizations..."

# Create some sample organizations
Organization.create!(
  email: "org1@example.com",  # Primary key
  org_name: "Organization 1",
  street: "1234 Main St",
  city: "Denver",
  org_state: "CO",
  zipcode: 80202,
  phoneNumber: "123-456-7890",
  webLink: "https://organization1.com",
  servicesSummary: "We provide essential community services.",
  avgStarValue: 4.5,
  admin_username: "admin1"
)

Organization.create!(
  email: "org2@example.com",
  org_name: "Organization 2",
  street: "5678 Broadway",
  city: "Aurora",
  org_state: "CO",
  zipcode: 80012,
  phoneNumber: "987-654-3210",
  webLink: "https://organization2.com",
  servicesSummary: "Offering educational programs and support.",
  avgStarValue: 4.2,
  admin_username: "admin2"
)

puts "Seeding users..."

# Create some sample users with valid age ranges
User.create!(
  username: "user1",  # Primary key
  email: "user1@example.com",
  firstName: "John",
  ageRange: "19-24",  # Valid age range
  hashedPasswd: "password123",
  zipCode: 80202
)

User.create!(
  username: "user2",
  email: "user2@example.com",
  firstName: "Jane",
  ageRange: "25-34",  # Valid age range
  hashedPasswd: "securepass",
  zipCode: 80012
)

puts "Seeding events..."

# Now that organizations, users, and admins exist, create events that reference them
Event.create!(
  title: "Community Food Drive",
  eventDate: Date.today + 3,
  eventTime: "09:00",
  eventDescription: "Join us for a community food drive to support local food banks.",
  street: "1234 Main St",
  city: "Denver",
  eventState: "CO",
  zipcode: 80202,
  isVirtual: false,
  meetingLink: nil,
  eventstatus: true,
  organization_id: "org1@example.com",  # References organization by primary key (email)
  user_id: "user1",  # References user by primary key (username)
  admin_id: "admin1"  # References admin by primary key (username)
)

Event.create!(
  title: "Virtual Job Fair",
  eventDate: Date.today + 7,
  eventTime: "14:00",
  eventDescription: "A virtual job fair connecting local businesses with job seekers.",
  street: "Virtual",
  city: "Denver",
  eventState: "CO",
  zipcode: 80203,
  isVirtual: true,
  meetingLink: "https://zoom.us/j/1234567890",
  eventstatus: true,
  organization_id: "org2@example.com",
  user_id: "user2",
  admin_id: "admin2"
)

puts "Finished seeding events!"
