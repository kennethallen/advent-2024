require 'test/unit'
require 'day12'

class Day12Test < Test::Unit::TestCase
  def test_sample
    assert_equal([140, 0], day12(File.foreach("data/12a.txt")))
    assert_equal([772, 0], day12(File.foreach("data/12b.txt")))
    assert_equal([1930, 0], day12(File.foreach("data/12c.txt")))
  end
  def test_challenge
    assert_equal([1375574, 0], day12(File.foreach("data/12.txt")))
  end
end
