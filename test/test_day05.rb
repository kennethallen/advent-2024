require 'test/unit'
require 'day05'

class Day05Test < Test::Unit::TestCase
  def test_sample
    assert_equal([143, 0], day05(File.foreach("data/05a.txt")))
  end
  def test_challenge
    assert_equal([4185, 0], day05(File.foreach("data/05.txt")))
  end
end
