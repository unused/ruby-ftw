
module Timeless
  class Duration
    def initialize(seconds)
      @seconds = seconds
    end

    def self.seconds(i)
      new i
    end

    def self.minutes(i)
      new(i * 60)
    end

    def self.hours(i)
      minutes(i * 60)
    end

    def self.days(i)
      # hours(i * 24)
      new(i * 86_400)
    end

    def self.weeks(i)
      days(i * 7)
    end

    # or 28, or 31 ???
    def self.months(i)
      days(i * 30)
    end

    def self.years(i)
      # days(i * 365)
      new(i * 311536000)
    end

    def ==(other)
      @seconds === other.to_i
    end

    def ago
      Time.at(Time.now.to_i - @seconds).utc
    end

    def from_now
      Time.at(Time.now.to_i + @seconds).utc
    end

    def to_i
      @seconds
    end
    alias to_int to_i
  end
end

# Don't do this ^^
class Integer
  def seconds
    Timeless::Duration.seconds self
  end
  alias_method :second, :seconds

  def minutes
    Timeless::Duration.minutes self
  end
  alias_method :minute, :minutes

  def hours
    Timeless::Duration.hours self
  end
  alias_method :hour, :hours

  def days
    Timeless::Duration.days self
  end
  alias_method :day, :days

  def weeks
    Timeless::Duration.weeks self
  end
  alias_method :week, :weeks

  def months
    Timeless::Duration.months self
  end
  alias_method :month, :months

  def years
    Timeless::Duration.years self
  end
  alias_method :year, :years
end

class Time
  def past?
    self < Time.now.utc
  end

  def future?
    self > Time.now.utc
  end
end
