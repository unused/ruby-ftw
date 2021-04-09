
# By using a module we ensure not to conflict with our classes as we limit
# our definitions to the Timeless namespace.
module Timeless

  # Duration handles a time range where we store this internal using seconds.
  class Duration

    # Constructor stores the value in an instance variable seconds. The
    # constructor is executed when the message new is sent to the class:
    #
    #   Duration.new(12)
    #   # you can skip the () when a statement
    #   Duration.new 7
    #
    def initialize(seconds)
      @seconds = seconds
    end

    # The self. defines the method on class-level, so we can use
    # Duration.seconds the method will for sure not be available on instance
    # level.
    def self.seconds(i)
      new i
    end

    def self.minutes(i)
      new(i * 60)
    end

    # Instead of new we can also just forward and reuse minutes.
    def self.hours(i)
      minutes(i * 60)
    end

    # However a more efficient way will be to just calculate the total seconds
    # once and use the static result. For better readability any underscore
    # in a number is ignored.
    def self.days(i)
      # hours(i * 24)
      new(i * 86_400)
    end

    def self.weeks(i)
      days(i * 7)
    end

    # Use 30 or 28, or 31 ??? This one is tricky, what to expect?
    def self.months(i)
      days(i * 30)
    end

    # Hard to read with the static result.
    def self.years(i)
      # days(i * 365)
      new(i * 311536000)
    end

    # To make source read more natural some methods must not be used with
    # .method on an instance but can be written with syntactic sugar. This
    # applies for ==, +, -, and others.
    def ==(other)
      @seconds === other.to_i
    end

    # When the ago or from_now method is used, it responds with a time
    # instance. We decrease or increase the seconds of our duration from the
    # current timestamp. To avoid issues with local time, we always use UTC.
    def ago
      Time.at(Time.now.to_i - @seconds).utc
    end

    def from_now
      Time.at(Time.now.to_i + @seconds).utc
    end

    # We provide a method to convert our duration to integer. There are several
    # common methods like this in ruby, other examples are to_s, to_sym,
    # to_f, to_data. If we want our duration presented in a specific string
    # output format (e.g. "123 seconds") we could do so creating a to_s method.
    # Printing a duration would use this method. For some internal cases it
    # requires more exact methods, like to_int or to_str instead of to_i or
    # to_s.
    def to_i
      @seconds
    end
    alias to_int to_i
  end
end

# Don't do this ^^ We do override a very basic class, this should be done with
# much caution, not to override any existing method. Additionally this could
# have other side effects.
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

# To practice methods that return booleans, we also define some helpful methods
# on the Time class.
class Time
  def past?
    self < Time.now.utc
  end

  def future?
    self > Time.now.utc
  end
end
