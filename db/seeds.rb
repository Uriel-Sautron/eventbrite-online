# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'activerecord-reset-pk-sequence'

ActiveRecord::Base.connection.disable_referential_integrity do
  User.delete_all
  User.reset_pk_sequence
  Event.delete_all
  Event.reset_pk_sequence
  Attendance.delete_all
  Attendance.reset_pk_sequence
  puts 'DB cleaned up !'
end


######## - USERS - #########

50.times do 
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email(domain: 'yopmail.com'),
    password: Faker::Internet.password(min_length: 6),
    description: Faker::GreekPhilosophers.quote
  )
end
tp User.all

######## - EVENTS - #########

10.times do 
  Event.create!(
    start_date: DateTime.now + rand(10..30),
    duration: rand(1..4) * 30,
    title: Faker::Movie.quote,
    description: Faker::Hipster.paragraph,
    price: rand(1..1000),
    location: Faker::Address.unique.city,
    event_admin_id: User.ids.sample)
end
tp Event.all

######## - ATTENDANCE - #########

10.times do 
  Attendance.create!(
    user_id: User.ids.sample,
    event_id: Event.ids.sample
  )
end
tp Attendance.all