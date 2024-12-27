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

class MemoPather
  def initialize(towels)
    @towels = towels
    @mem = {"" => 1}
  end
  
  def count_paths(state)
    @mem[state] || begin
      @mem[state] = @towels.filter do |t|
        t == state[...t.length]
      end.sum do |t|
        count_paths state[t.length..]
      end
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
=begin
    designs.sum do |d|
      terms, paths = pather.path_all(d, paths)
      terms.sum {|t| paths[t][1].length }
    end,
=end
    begin
      mempath = MemoPather.new(towels)
      designs.sum {|d| mempath.count_paths d }
    end
  ]
end
