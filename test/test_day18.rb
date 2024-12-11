require 'test/unit'
require 'day18'

class Day18Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day18(File.foreach("data/18a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day18(File.foreach("data/18.txt")))
  end
end
