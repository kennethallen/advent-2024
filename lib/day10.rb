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

def day10(lines)
  map = lines.map do |l|
    l[...-1].each_char.map(&:to_i)
  end
  y_limit, x_limit = map.length, map[0].length

  [
    map.each_with_index.flat_map do |row, y|
      row.each_with_index.filter_map do |cell, x|
        if cell == 0
          djikstra([y, x]) do |y, x|
            [
              ([y-1, x] if y > 0),
              ([y+1, x] if y+1 < y_limit),
              ([y, x-1] if x > 0),
              ([y, x+1] if x+1 < x_limit),
            ].compact.filter do |ay, ax|
              map[ay][ax] - map[y][x] == 1
            end
          end.count do |(end_y, end_x), _|
            map[end_y][end_x] == 9
          end
        end
      end
    end.sum,
    0,
  ]
end
