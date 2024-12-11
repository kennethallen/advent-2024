require 'test/unit'
require 'day16'

class Day16Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day16(File.foreach("data/16a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day16(File.foreach("data/16.txt")))
  end
end
