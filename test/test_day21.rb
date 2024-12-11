require 'test/unit'
require 'day21'

class Day21Test < Test::Unit::TestCase
  def test_sample
    assert_equal([0, 0], day21(File.foreach("data/21a.txt")))
  end
  def test_challenge
    assert_equal([0, 0], day21(File.foreach("data/21.txt")))
  end
end
