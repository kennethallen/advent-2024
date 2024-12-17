require 'util'

class Pather10
include AStar
  def initialize(map, dims)
    @map = map
    @dims = dims
  end

  def nexts((y, x))
    neighbors([y, x], @dims).filter do |ay, ax|
      @map[ay][ax] - @map[y][x] == 1
    end.map {|n| [1, n] }
  end
end

def day10(lines)
  map = lines.map do |l|
    l[...-1].each_char.map(&:to_i)
  end
  dims = map.length, map[0].length
  trailheads = map.each_with_index.flat_map do |row, y|
    row.each_with_index.filter_map do |cell, x|
      [y, x] if cell == 0
    end
  end

  pather = Pather10.new(map, dims)

  [
    trailheads.sum do |y, x|
      pather.path([y, x])[1].keys.count do |end_y, end_x|
        map[end_y][end_x] == 9
      end
    end,
    trailheads.sum do |y, x|
      pather.path_all([y, x])[1].filter do |(end_y, end_x), _|
        map[end_y][end_x] == 9
      end.sum {|_, (_, paths)| paths.length }
    end,
  ]
end
