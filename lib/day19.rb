require 'util'

class Pather19
  include AStar

  def initialize(towels)
    @towels = towels
  end

  def terminal?(pos) = pos.empty?

  def heuristic(pos) = pos.length

  def nexts(state)
    @towels.filter_map do |t|
      [t.length, state[t.length..]] if t == state[...t.length]
    end
  end
end

def day19(lines)
  towels, _, *designs = lines.to_a
  towels = towels[...-1].split(/, /)
  designs = designs.map {|d| d[...-1] }
  pather = Pather19.new towels

  [
    designs.count do |d|
      pather.path(d)[0]
    end,
    0,
  ]
end
