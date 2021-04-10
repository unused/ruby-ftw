
# Timeless

A time handling package to showcase the beauty of Ruby.

## Usage

```ruby
require 'timeless'

print (5.days + 5.hours + 5.minutes).from_now # Time<2021...
```

## Development

```sh
$ gem install bundler
$ bundle install
$ bundle exec ruby tests/*
$ bundle exec irb -r './timeless'
$ bundle exec ruby example.rb
```
