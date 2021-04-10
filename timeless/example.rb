
require 'mongoid'
require 'faker'
require 'pry'

require_relative './timeless'

Mongoid.configure do |config|
  config.clients.default = {
    hosts: ['localhost:27017'],
    database: 'timeless_example'
  }
end

class User
  include Mongoid::Document

  field :name, type: String
  field :joined_at, type: Time
end

User.delete_all unless User.count.zero?

print 'Generating test data...'
500.times do
  User.create name: Faker::Name.name,
              joined_at: Faker::Time.backward(days: 14)
  print '.'
end
print "\n"

binding.pry
