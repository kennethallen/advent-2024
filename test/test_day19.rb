require 'test/unit'
require 'day19'

class Day19Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day19(File.foreach("data/19a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day19(File.foreach("data/19.txt")))
  end
end
