require 'test/unit'
require 'day18'

class Day18Test < Test::Unit::TestCase
  def test_sample
    assert_equal([22, "6,1"], day18(File.foreach("data/18a.txt")))
  end
  def test_challenge
    slow
    assert_equal([338, "20,44"], day18(File.foreach("data/18.txt")))
  end
end
