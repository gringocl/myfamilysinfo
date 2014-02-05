# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
# puts 'DEFAULT USERS'
# user = User.find_or_create_by_email :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
# puts 'user: ' << user.email
require 'ffaker'

def sample_text
  #(1..10).map{|i|"<p>#{Faker::HTMLIpsum.fancy_string}</p>"}.join
end

begin
  15.times do
    User.new.tap do |u|
      u.email = Faker::Internet.email
      u.password = 'password'
      u.name = Faker::Name.name
      u.save!
    end
  end

  45.times do
    Kid.new.tap do |k|
      k.name = Faker::Name.first_name
      k.save!
    end
  end

  kid = Kid.all.each do |k|
    user = User.order( 'RANDOM()' ).first
    relation = Relationship.create ({kid: k, user: user, role: "Father"})
    relation.save!
  end
end
