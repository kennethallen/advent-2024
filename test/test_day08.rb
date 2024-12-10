require 'test/unit'
require 'day08'
require 'util'

class Day08Test < Test::Unit::TestCase
  def test_sample
    assert_equal([14, 34], day08(File.foreach("data/08a.txt")))
  end
  def test_challenge
    assert_equal([413, 1417], day08(File.foreach("data/08.txt")))
  end
end
