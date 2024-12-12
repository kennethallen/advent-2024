require 'test/unit'
require 'day07'
require 'test_util'

class Day07Test < Test::Unit::TestCase
  def test_sample
    assert_equal([3749, 11387], day07(File.foreach("data/07a.txt")))
  end
  def test_challenge
    slow
    assert_equal([1430271835320, 456565678667482], day07(File.foreach("data/07.txt")))
  end
end
