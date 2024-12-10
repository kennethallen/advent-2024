require 'test/unit'
require 'day09'
require 'util'

class Day09Test < Test::Unit::TestCase
  def test_sample
    assert_equal([1928, 0], day09(File.foreach("data/09a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day09(File.foreach("data/09.txt")))
  end
end
