require 'test/unit'
require 'day15'

class Day15Test < Test::Unit::TestCase
  def test_sample
    assert_equal([2028, 1751], day15(File.foreach("data/15a.txt")))
    assert_equal([10092, 9021], day15(File.foreach("data/15b.txt")))
  end
  def test_challenge
    assert_equal([1349898, 1376686], day15(File.foreach("data/15.txt")))
  end
end
