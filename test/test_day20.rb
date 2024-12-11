require 'test/unit'
require 'day20'

class Day20Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day20(File.foreach("data/20a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day20(File.foreach("data/20.txt")))
  end
end
