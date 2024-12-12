require 'util'

private def djikstra(start)
  to_visit = [[start, []]]
  visited = {}
  while entry = to_visit.pop
    node, path = entry
    unless visited.include? node
      visited[node] = path
      forward_path = path + [node]
      (yield node).each do |forward|
        unless visited.include? forward
          to_visit.prepend [forward, forward_path]
        end
      end
    end
  end
  visited
end

private def djikstra_all(start)
  to_visit = [[start, []]]
  visited = Hash.new {|h, k| h[k] = Set.new }
  while entry = to_visit.pop
    node, path = entry

    visited[node] << path
    forward_path = path + [node]
    (yield node).each do |forward|
      to_visit << [forward, forward_path]
    end
  end
  visited
end

private def nexts((y, x), map, dims)
  neighbors([y, x], dims).filter do |ay, ax|
    map[ay][ax] - map[y][x] == 1
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

  [
    trailheads.sum do |y, x|
      djikstra([y, x]) do |pos|
        nexts(pos, map, dims)
      end.count do |(end_y, end_x), _|
        map[end_y][end_x] == 9
      end
    end,
    trailheads.sum do |y, x|
      djikstra_all([y, x]) do |pos|
        nexts(pos, map, dims)
      end.filter do |(end_y, end_x), _|
        map[end_y][end_x] == 9
      end.sum {|_, paths| paths.length }
    end,
  ]
end
