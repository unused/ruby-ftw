

module Timeless
  class Duration

    def initialize(seconds)
      @seconds = seconds
    end

    # Duration.days 123
    def self.days(i)
      new i * 86400
    end

    def self.weeks(i)
      # new i * 7 * 24 * 60 * 60
      days i * 7
    end

    def ==(other)
      @seconds === other.to_i
    end

    def to_i
      @seconds
    end
    alias to_int to_i

    def from_now
      Time.at(Time.now.to_i + @seconds).utc
    end

    def ago
      Time.at(Time.now.to_i - @seconds).utc
    end
  end
end

class Integer
  def days
    Timeless::Duration.days self
  end
  alias day days

  def weeks
    Timeless::Duration.weeks self
  end
  alias week weeks
end
