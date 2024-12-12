require 'test/unit'
require 'day12'

class Day12Test < Test::Unit::TestCase
  def test_sample
    assert_equal([140, 80], day12(File.foreach("data/12a.txt")))
    assert_equal([772, 436], day12(File.foreach("data/12b.txt")))
    assert_equal([1930, 1206], day12(File.foreach("data/12c.txt")))
    assert_equal([692, 236], day12(File.foreach("data/12d.txt")))
    assert_equal([1184, 368], day12(File.foreach("data/12e.txt")))
  end
  def test_challenge
    assert_equal([1375574, 830566], day12(File.foreach("data/12.txt")))
  end
end
