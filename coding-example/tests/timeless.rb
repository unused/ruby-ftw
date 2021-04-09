
# Make minitest find our test cases and use a colorful output.
require 'minitest/autorun'
require 'minitest/pride'

# Import our package.
require_relative '../timeless'

# Let's use some test helpers.
class TestHelper
  # A list of methods defined as constant. Freeze will ensure the array does
  # not get changed (there are no constant arrays or objects in ruby).
  # %i[] is a shorthand to define an array of symbols: [:seconds, :minutes, ...
  DURATION_METHODS = %i[seconds minutes hours days weeks months years].freeze

  # Get a random number, we could also use Faker::Number or just use math
  # random. The current method builds a range, converts to an array and picks
  # one element. A bit of an overhead if we would use more numbers. But easy
  # to read and fast enough, so let's keep it.
  def self.random_number
    (1..250).to_a.sample
  end

  # A pretty quick helper, remove the `s` at the end of a string and it is
  # a singular ^^
  def self.singularize(str)
    str[..-2] # skip the s - what's irregular?
  end
end

# Define our Testclass for the package. Every method prefixed with test_ will
# be found and executed as testcase.
class TestTimeless < Minitest::Test

  def test_does_not_break_with_zero
    assert_equal 0.days, 0
  end

  def test_convert_day
    assert_equal 1.day, 86_400
  end

  def test_convert_days
    assert_equal 2.days, 2 * 86_400
  end

  def test_compare
    assert_equal 1.week, 7.days
  end

  def test_detect_past
    assert TestHelper.random_number.day.ago.past?
  end

  def test_detect_future
    assert TestHelper.random_number.day.from_now.future?
  end

  def test_combination
    assert_equal 1.week.from_now - 14.days, 1.week.ago
  end
end

class TestTimelessDuration < Minitest::Test

  def test_class_convert_methods
    assert TestHelper::DURATION_METHODS.all? do |method|
      Timeless::Duration.respond_to? :method
    end
  end
end

class TestIntegerExtension < Minitest::Test

  # Minitest also checks for a setup callback (and others) to prepare some
  # preconditions or test subjects.
  def setup
    @number = TestHelper.random_number
  end

  def test_convert_methods
    assert TestHelper::DURATION_METHODS.all? do |method|
      @number.respond_to? method.to_sym
    end
  end

  def test_convert_singular_methods
    assert TestHelper::DURATION_METHODS.all? do |method|
      @number.respond_to? TestHelper.singularize(method).to_sym
    end
  end
end

class TestTimeExtension < Minitest::Test
  def test_past
    assert Time.at(0).past?
  end

  def test_future
    assert Time.at(2_000_000_000).future?
  end
end
