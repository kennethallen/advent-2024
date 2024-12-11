require 'test/unit'
require 'day24'

class Day24Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day24(File.foreach("data/24a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day24(File.foreach("data/24.txt")))
  end
end
