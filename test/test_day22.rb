require 'test/unit'
require 'day22'

class Day22Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day22(File.foreach("data/22a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day22(File.foreach("data/22.txt")))
  end
end
