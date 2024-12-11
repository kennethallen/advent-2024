require 'test/unit'
require 'day15'

class Day15Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day15(File.foreach("data/15a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day15(File.foreach("data/15.txt")))
  end
end
