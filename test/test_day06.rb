require 'test/unit'
require 'day06'
require 'test_util'

class Day06Test < Test::Unit::TestCase
  def test_sample
    assert_equal([41, 6], day06(File.foreach("data/06a.txt")))
  end
  def test_challenge
    slow
    assert_equal([5131, 1784], day06(File.foreach("data/06.txt")))
  end
end
