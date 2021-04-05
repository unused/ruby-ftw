
# Project Init

Create a new project, let's call it timeless...

```sh
mkdir timeless
cd timeless
git init
vim README.md # Edit Project Title, Description, Usage and Setup
# Ruby packages are called gems or rubygems. There is a nice packagemanager
# named gem that ships with ruby.
gem install --help
# gem install bundler
# NOTE on container via podman
gem info bundler
bundle init # initialize package handler
vim Gemfile
  gem 'minitest'
# bundle install --path vendor/bundle
bundle config set path 'vendor/bundle'
echo vendor >> .gitignore
git add .
git commit -m 'Init project'
```

Rubyists embrace testing, you won't find any widely used package that hasn't
a proper testsuite. A small but powerful framework to get started is minitest.

```
mkdir tests
vim tests/timeless.rb
  require 'minitest/autorun'
  require 'minitest/pride'

  # require_relative '../timeless'

  class TestTimeless < Minitest::Test
    # Include all GOALS for the demonstration:
    #   conversion, addition, subtraction, relative date
    def test_convert_days
      assert_equal 5.days.to_i, 5 * 24 * 60 * 60
    end
  end

bundle exec ruby tests/timeless.rb

vim timeless.rb
  module Timeless
    class Duration
      def initialize(seconds)
        @seconds = seconds
      end

      def self.days(i)
        i * 24 * 60 * 60
      end

      def ==(other)
        @seconds === other.to_i
      end

      def to_i
        @seconds
      end
    end
  end

  class Integer
    def days
      Timeless::Duration.days self
    end
    alias :day :days
  end

bundle exec ruby tests/timeless.rb
```

# Extend Functionality

```ruby
# tests/timeless.rb
class TestTimeless < Minitest::Test

  def test_convert_week
    assert_equal 1.week, 7 * 24 * 60 * 60
  end

  def test_compare
    assert_equal 1.week, 7.days
  end

  def test_combination
    assert_equal 1.week.from_now - 17.days, 1.week.ago
  end
end

class TestTimelessDuration < Minitest::Test
  def setup
    @duration = Timeless::Duration.new 7
  end

  def test_class_convert_method
    assert Timeless::Duration.respond_to? :days
  end
end

# timeless.rb
# ...
class Duration
  def ago
    Time.at(Time.now.to_i - @seconds).utc
  end

  def from_now
    Time.at(Time.now.to_i + @seconds).utc
  end
end
```

# Final Usage

Add [mongoid](https://github.com/mongodb/mongoid) mongodb database abstraction
and [faker](https://github.com/faker-ruby/faker) test data generator.

```sh
$ podman start mongodb
```

```ruby
# Gemfile
gem "mongoid"
gem "faker"
gem "pry"

# see example.com
```
