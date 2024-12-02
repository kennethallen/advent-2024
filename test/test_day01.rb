require 'test/unit'
require 'day01'

class Day01Test < Test::Unit::TestCase
  def test_sample
    assert_equal([11, 31], day01(File.foreach("data/01a.txt")))
  end
  def test_challenge
    assert_equal([1941353, 22539317], day01(File.foreach("data/01.txt")))
  end
end
