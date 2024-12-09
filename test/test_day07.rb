require 'test/unit'
require 'day07'
require 'util'

class Day07Test < Test::Unit::TestCase
  def test_sample
    assert_equal([3749, 0], day07(File.foreach("data/07a.txt")))
  end
  def test_challenge
    assert_equal([1430271835320, 0], day07(File.foreach("data/07.txt")))
  end
end
