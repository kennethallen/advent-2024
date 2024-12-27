require 'util'

class Pather18
  include AStar

  def initialize(map, dims)
    @map = map
    @dims = dims
    @t_end = [dims[0] - 1, dims[1] - 1]
  end

  def terminal?(pos) = pos == @t_end

  def heuristic((y, x))
    ty, tx = @t_end
    (y - ty).abs + (x - tx).abs
  end

  def nexts((y, x))
    neighbors([y, x], @dims).filter_map do |ny, nx|
      [1, [ny, nx]] unless @map[ny][nx]
    end
  end
end

def day18(lines)
  lines = lines.to_a
  dims = /^size (\d+)x(\d+)$/.match(lines[0])[1..].map(&:to_i)
  take = /^part 1 take (\d+)$/.match(lines[1])[1].to_i
  corrupts = lines[2..].map do |s|
    /^(\d+),(\d+)$/.match(s)[1..].map(&:to_i)
  end
  map = Array.new(dims[0]) { Array.new dims[1] }
  pather = Pather18.new(map, dims)

  corrupts[...take].each do |x, y|
    map[y][x] = :wall
  end
  term, paths = pather.path([0, 0])

  [
    paths[term][1].length,
    corrupts[take..].each do |x, y|
      map[y][x] = :wall
      term, _ = pather.path([0, 0])
      break "#{x},#{y}" unless term
    end,
  ]
end
