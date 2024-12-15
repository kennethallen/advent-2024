require 'test/unit'
require 'day15'

class Day15Test < Test::Unit::TestCase
  def test_sample
    assert_equal([2028, 0], day15(File.foreach("data/15a.txt")))
    assert_equal([10092, 0], day15(File.foreach("data/15b.txt")))
  end
  def test_challenge
    assert_equal([1349898, 0], day15(File.foreach("data/15.txt")))
  end
end
