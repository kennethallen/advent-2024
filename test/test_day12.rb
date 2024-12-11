require 'test/unit'
require 'day12'

class Day12Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day12(File.foreach("data/12a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day12(File.foreach("data/12.txt")))
  end
end
