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

# Create sample admins
Admin.find_or_create_by!(username: "admin1") do |admin|
  admin.email = "admin1@example.com"
  admin.firstName = "Admin"
  admin.protectedPasswd = "adminpass123"
end

Admin.find_or_create_by!(username: "admin2") do |admin|
  admin.email = "admin2@example.com"
  admin.firstName = "SuperAdmin"
  admin.protectedPasswd = "supersecure"
end

puts "Seeding organizations..."

# Create sample organizations
Organization.find_or_create_by!(email: "org1@example.com") do |org|
  org.org_name = "Organization 1"
  org.street = "1234 Main St"
  org.city = "Denver"
  org.org_state = "CO"
  org.zipcode = 80202
  org.phoneNumber = "123-456-7890"
  org.webLink = "https://organization1.com"
  org.servicesSummary = "We provide essential community services."
  org.avgStarValue = 4.5
  org.admin_username = "admin1"
end

Organization.find_or_create_by!(email: "org2@example.com") do |org|
  org.org_name = "Organization 2"
  org.street = "5678 Broadway"
  org.city = "Aurora"
  org.org_state = "CO"
  org.zipcode = 80012
  org.phoneNumber = "987-654-3210"
  org.webLink = "https://organization2.com"
  org.servicesSummary = "Offering educational programs and support."
  org.avgStarValue = 4.2
  org.admin_username = "admin2"
end

puts "Seeding users..."

# Create sample users with valid age ranges
User.find_or_create_by!(username: "user1") do |user|
  user.email = "user1@example.com"
  user.firstName = "John"
  user.ageRange = "19-24"
  user.hashedPasswd = "password123"
  user.zipCode = 80202
end

User.find_or_create_by!(username: "user2") do |user|
  user.email = "user2@example.com"
  user.firstName = "Jane"
  user.ageRange = "25-34"
  user.hashedPasswd = "securepass"
  user.zipCode = 80012
end

puts "Seeding events..."

# Create sample events
Event.find_or_create_by!(title: "Community Food Drive", eventDate: Date.today + 3) do |event|
  event.eventTime = "09:00"
  event.eventDescription = "Join us for a community food drive to support local food banks."
  event.street = "1234 Main St"
  event.city = "Denver"
  event.eventState = "CO"
  event.zipcode = 80202
  event.isVirtual = false
  event.meetingLink = nil
  event.eventstatus = true
  event.organization_id = "org1@example.com"
  event.user_id = "user1"
  event.admin_id = "admin1"
end

Event.find_or_create_by!(title: "Virtual Job Fair", eventDate: Date.today + 7) do |event|
  event.eventTime = "14:00"
  event.eventDescription = "A virtual job fair connecting local businesses with job seekers."
  event.street = "Virtual"
  event.city = "Denver"
  event.eventState = "CO"
  event.zipcode = 80203
  event.isVirtual = true
  event.meetingLink = "https://zoom.us/j/1234567890"
  event.eventstatus = true
  event.organization_id = "org2@example.com"
  event.user_id = "user2"
  event.admin_id = "admin2"
end

Event.find_or_create_by!(title: "Virtual Tech Meetup", eventDate: Date.today + 5) do |event|
  event.eventTime = "14:00"
  event.eventDescription = "A virtual meetup for tech enthusiasts to network and discuss the latest trends."
  event.street = nil
  event.city = nil
  event.eventState = nil
  event.zipcode = nil
  event.isVirtual = true
  event.meetingLink = "http://example.com/meetup"
  event.eventstatus = true
  event.organization_id = "org2@example.com"
  event.user_id = "user2"
  event.admin_id = "admin2"
end

Event.find_or_create_by!(title: "Neighborhood Cleanup", eventDate: Date.today + 10) do |event|
  event.eventTime = "08:00"
  event.eventDescription = "Help clean up our neighborhood park and surrounding areas."
  event.street = "5678 Park Ave"
  event.city = "Aurora"
  event.eventState = "CO"
  event.zipcode = 80012
  event.isVirtual = false
  event.meetingLink = nil
  event.eventstatus = true
  event.organization_id = "org3@example.com"
  event.user_id = "user3"
  event.admin_id = "admin3"
end

Event.find_or_create_by!(title: "Coding Bootcamp", eventDate: Date.today + 14) do |event|
  event.eventTime = "10:00"
  event.eventDescription = "A free coding bootcamp for beginners looking to learn programming."
  event.street = "3456 Elm St"
  event.city = "Boulder"
  event.eventState = "CO"
  event.zipcode = 80301
  event.isVirtual = false
  event.meetingLink = nil
  event.eventstatus = true
  event.organization_id = "org4@example.com"
  event.user_id = "user4"
  event.admin_id = "admin4"
end

Event.find_or_create_by!(title: "Mental Health Awareness Webinar", eventDate: Date.today + 7) do |event|
  event.eventTime = "12:00"
  event.eventDescription = "A webinar on mental health awareness and resources available in the community."
  event.street = nil
  event.city = nil
  event.eventState = nil
  event.zipcode = nil
  event.isVirtual = true
  event.meetingLink = "http://example.com/webinar"
  event.eventstatus = true
  event.organization_id = "org5@example.com"
  event.user_id = "user5"
  event.admin_id = "admin5"
end

Event.find_or_create_by!(title: "Back-to-School Supply Drive", eventDate: Date.today + 20) do |event|
  event.eventTime = "11:00"
  event.eventDescription = "Donate school supplies to help kids in need prepare for the new school year."
  event.street = "910 Willow St"
  event.city = "Fort Collins"
  event.eventState = "CO"
  event.zipcode = 80524
  event.isVirtual = false
  event.meetingLink = nil
  event.eventstatus = true
  event.organization_id = "org6@example.com"
  event.user_id = "user6"
  event.admin_id = "admin6"
end

puts "Finished seeding events!"

