require 'test/unit'
require 'day09'
require 'test_util'

class Day09Test < Test::Unit::TestCase
  def test_sample
    assert_equal([1928, 2858], day09(File.foreach("data/09a.txt")))
  end
  def test_challenge
    slow
    assert_equal([6430446922192, 6460170593016], day09(File.foreach("data/09.txt")))
  end
end
