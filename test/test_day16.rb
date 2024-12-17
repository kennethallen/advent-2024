require 'test/unit'
require 'day16'
require 'test_util'

class Day16Test < Test::Unit::TestCase
  def test_sample
    assert_equal([7036, 45], day16(File.foreach("data/16a.txt")))
    assert_equal([11048, 64], day16(File.foreach("data/16b.txt")))
  end
  def test_challenge
    slow
    assert_equal([107512, 561], day16(File.foreach("data/16.txt")))
  end
end
