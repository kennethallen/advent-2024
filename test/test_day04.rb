require 'test/unit'
require 'day04'

class Day04Test < Test::Unit::TestCase
  def test_sample
    assert_equal([18, 0], day04(File.foreach("data/04a.txt")))
  end
  def test_challenge
    assert_equal([2654, 0], day04(File.foreach("data/04.txt")))
  end
end
