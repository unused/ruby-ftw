
require 'mongoid' # MongoDB database abstraction
require 'faker' # Fake Data Generators
require 'pry' # Debugger

# Import our package.
require_relative './timeless'

# Configure a monogo database connection.
Mongoid.configure do |config|
  config.clients.default = {
    hosts: ['localhost:27017'],
    database: 'timeless_example',
  }
end

# We setup a database model, see the Mongoid rubygem for more details or
# ActiveRecord for similar database abstraction for SQL databases.
class User
  include Mongoid::Document

  field :name, type: String
  field :joined_at, type: Time
end

# Remove all users if any exist.
User.delete_all unless User.count.zero?

puts "Generating test data..."
500.times do
  # Faker does provide dynamic test data. This is a great way of filling
  # development databases with dummy data or using more realistic data for
  # tests which will sometimes even discover unexpected behaviour.
  #
  # Faker::Name.name provides a random name, Faker::Time.backward(days: 14) any
  # time in between the last two weeks. Have a look at the faker rubygem, it
  # has so many other useful generators (phone numbers, internet usernames,
  # email addresses, etc.) and also some fun ones (tv names, simpson quotes,
  # etc.).
  User.create name: Faker::Name.name,
              joined_at: Faker::Time.backward(days: 14)
  print "."
end
print "\n"

# Try out some queries on our test data:
#   User.count # ... 500
#   User.last.name # ... Mister Mayer
#   User.limit(5).pluck(:name, :joined_at) # ... [[...]]
#   User.where(:joined_at.gte => 1.day.ago).pluck(:name, :joined_at) # ... [[...]]
#   User.where(:joined_at.gte => 1.day.ago).order_by(joined_at: :desc).pluck(:joined_at) # ... [[...]]
binding.pry # start debugging session
