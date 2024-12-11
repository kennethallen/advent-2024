require 'test/unit'
require 'day17'

class Day17Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day17(File.foreach("data/17a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day17(File.foreach("data/17.txt")))
  end
end
