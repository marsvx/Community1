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

admin3 = Admin.find_or_create_by!(username: "admin3") do |admin|
  admin.email = "admin3@example.com"
  admin.firstName = "AdminThree"
  admin.protectedPasswd = "adminpass123"
end

admin4 = Admin.find_or_create_by!(username: "admin4") do |admin|
  admin.email = "admin4@example.com"
  admin.firstName = "AdminFour"
  admin.protectedPasswd = "adminpass123"
end

admin5 = Admin.find_or_create_by!(username: "admin5") do |admin|
  admin.email = "admin5@example.com"
  admin.firstName = "AdminFive"
  admin.protectedPasswd = "adminpass123"
end

admin6 = Admin.find_or_create_by!(username: "admin6") do |admin|
  admin.email = "admin6@example.com"
  admin.firstName = "AdminSix"
  admin.protectedPasswd = "adminpass123"
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

org3 = Organization.find_or_create_by!(email: "org3@example.com") do |org|
  org.org_name = "Organization 3"
  org.street = "5678 Park Ave"
  org.city = "Aurora"
  org.org_state = "CO"
  org.zipcode = 80012
  org.phoneNumber = "555-555-5555"
  org.webLink = "https://org3.com"
  org.servicesSummary = "We help clean up parks."
  org.avgStarValue = 4.8
  org.admin_username = admin3.username
end

org4 = Organization.find_or_create_by!(email: "org4@example.com") do |org|
  org.org_name = "Organization 4"
  org.street = "3456 Elm St"
  org.city = "Boulder"
  org.org_state = "CO"
  org.zipcode = 80301
  org.phoneNumber = "555-555-4444"
  org.webLink = "https://org4.com"
  org.servicesSummary = "We offer coding bootcamps."
  org.avgStarValue = 4.9
  org.admin_username = admin4.username
end

org5 = Organization.find_or_create_by!(email: "org5@example.com") do |org|
  org.org_name = "Organization 5"
  org.street = "Virtual"
  org.city = "Lakewood"
  org.org_state = "CO"
  org.zipcode = 82390
  org.phoneNumber = "555-555-3333"
  org.webLink = "https://org5.com"
  org.servicesSummary = "We raise mental health awareness."
  org.avgStarValue = 4.7
  org.admin_username = admin5.username
end

org6 = Organization.find_or_create_by!(email: "org6@example.com") do |org|
  org.org_name = "Organization 6"
  org.street = "910 Willow St"
  org.city = "Fort Collins"
  org.org_state = "CO"
  org.zipcode = 80524
  org.phoneNumber = "555-555-2222"
  org.webLink = "https://org6.com"
  org.servicesSummary = "We provide school supplies."
  org.avgStarValue = 4.6
  org.admin_username = admin6.username
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

user3 = User.find_or_create_by!(username: "user3") do |user|
  user.email = "user3@example.com"
  user.firstName = "UserThree"
  user.ageRange = "35-70"
  user.hashedPasswd = "password123"
  user.zipCode = 80012
end

user4 = User.find_or_create_by!(username: "user4") do |user|
  user.email = "user4@example.com"
  user.firstName = "UserFour"
  user.ageRange = "25-34"
  user.hashedPasswd = "password123"
  user.zipCode = 80301
end

user5 = User.find_or_create_by!(username: "user5") do |user|
  user.email = "user5@example.com"
  user.firstName = "UserFive"
  user.ageRange = "19-24"
  user.hashedPasswd = "password123"
  user.zipCode = nil
end

user6 = User.find_or_create_by!(username: "user6") do |user|
  user.email = "user6@example.com"
  user.firstName = "UserSix"
  user.ageRange = "35-70"
  user.hashedPasswd = "password123"
  user.zipCode = 80524
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
  event.street = "1234 Security Drive"
  event.city = "Aurora"
  event.eventState = "CO"
  event.zipcode = 80014
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
  event.street = "3245 Perspective Ave."
  event.city = "Denver"
  event.eventState = "CO"
  event.zipcode = 80231
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

