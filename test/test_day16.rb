require 'test/unit'
require 'day16'

class Day16Test < Test::Unit::TestCase
  def test_sample
    assert_equal([7036, 0], day16(File.foreach("data/16a.txt")))
    assert_equal([11048, 0], day16(File.foreach("data/16b.txt")))
  end
  def test_challenge
    assert_equal([107512, 0], day16(File.foreach("data/16.txt")))
  end
end
