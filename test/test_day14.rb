require 'test/unit'
require 'day14'

class Day14Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day14(File.foreach("data/14a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day14(File.foreach("data/14.txt")))
  end
end
