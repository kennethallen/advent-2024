require 'test/unit'
require 'day03'

class Day03Test < Test::Unit::TestCase
  def test_sample
    assert_equal([161, 48], day03(File.foreach("data/03a.txt")))
  end
  def test_challenge
    assert_equal([175015740, 112272912], day03(File.foreach("data/03.txt")))
  end
end
