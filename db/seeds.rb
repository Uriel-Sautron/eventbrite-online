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
  puts 'DB cleaned up !'

50.times do
  User.create!{
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    email: Faker::Internet.unique.email(domain: 'yopmail.com')
    encrypted_password: Faker::Internet.password(min_length: 6)
    description: Faker::GreekPhilosophers.quote,
    email: Faker::Internet.unique.free_email,
  }
end
tp User.all