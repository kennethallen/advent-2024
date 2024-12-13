require 'test/unit'
require 'day13'

class Day13Test < Test::Unit::TestCase
  def test_sample
    assert_equal([480, 0], day13(File.foreach("data/13a.txt")))
  end
  def test_challenge
    assert_equal([35255, 0], day13(File.foreach("data/13.txt")))
  end
end
