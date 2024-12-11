require 'test/unit'
require 'day11'

class Day11Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day11(File.foreach("data/11a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day11(File.foreach("data/11.txt")))
  end
end
