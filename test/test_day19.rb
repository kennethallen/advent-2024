require 'test/unit'
require 'day19'

class Day19Test < Test::Unit::TestCase
  def test_sample
    assert_equal([6, 16], day19(File.foreach("data/19a.txt")))
  end
  def test_challenge
    slow
    assert_equal([317, 883443544805484], day19(File.foreach("data/19.txt")))
  end
end
