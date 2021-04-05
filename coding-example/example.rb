require_relative './timeless'
require 'mongoid'
require 'faker'

Mongoid.configure do |config|
  config.clients.default = {
    hosts: ['localhost:27017'],
    database: 'timeless_example',
  }
end

class User
  include Mongoid::Document

  field :name, type: String
  field :joined_at, type: Time
end

User.delete_all unless User.count.zero?

puts "Generating test data..."
500.times do
  User.create name: Faker::Name.name,
              joined_at: Faker::Time.backward(days: 14)
  print "."
end
print "\n"

# User.count ... 500
# User.last.name ... Mister Mayer
# User.limit(5).pluck(:name, :joined_at) ... [[...]]
# User.where(:joined_at.gte => 1.day.ago).pluck(:name, :joined_at) ... [[...]]
# User.where(:joined_at.gte => 1.day.ago).order_by(joined_at: :desc).pluck(:joined_at) ... [[...]]
require 'pry'; binding.pry
