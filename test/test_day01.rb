require 'test/unit'
require 'day01'

class Day01Test < Test::Unit::TestCase
  def test
    assert_equal(day01(File.foreach("data/01a.txt")), [11, 31])
    assert_equal(day01(File.foreach("data/01.txt")), [1941353, 22539317])
  end
end
