require 'test/unit'
require 'day25'

class Day25Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day25(File.foreach("data/25a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day25(File.foreach("data/25.txt")))
  end
end
