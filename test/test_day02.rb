require 'test/unit'
require 'day02'

class Day02Test < Test::Unit::TestCase
  def test_sample
    assert_equal([2, 4], day02(File.foreach("data/02a.txt")))
  end
  def test_challenge
    assert_equal([299, 364], day02(File.foreach("data/02.txt")))
  end
end
