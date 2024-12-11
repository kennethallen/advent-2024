require 'test/unit'
require 'day23'

class Day23Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day23(File.foreach("data/23a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day23(File.foreach("data/23.txt")))
  end
end
