
require 'minitest/autorun'
require 'minitest/pride'

require_relative '../timeless'

class TestTimeless < Minitest::Test

  def test_convert_days
    assert_equal 5.days.to_i, 5 * 24 * 60 * 60
  end

  def test_convert_weeks
    assert_equal 1.week, 7.days
  end

  def test_combinations
    assert_equal 1.week.from_now - 14.days, 7.days.ago
  end
end
