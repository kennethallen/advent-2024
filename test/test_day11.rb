require 'test/unit'
require 'day11'

class Day11Test < Test::Unit::TestCase
  def test_sample
    assert_equal([55312, 65601038650482], day11(File.foreach("data/11a.txt")))
  end
  def test_challenge
    assert_equal([175006, 207961583799296], day11(File.foreach("data/11.txt")))
  end
end
