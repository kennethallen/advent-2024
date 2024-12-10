require 'test/unit'
require 'day10'
require 'util'

class Day10Test < Test::Unit::TestCase
  def test_sample
    assert_equal([36, 81], day10(File.foreach("data/10a.txt")))
  end
  def test_challenge
    assert_equal([552, 1225], day10(File.foreach("data/10.txt")))
  end
end
