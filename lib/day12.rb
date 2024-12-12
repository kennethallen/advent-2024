def day12(lines)
  map = lines.map {|l| l[...-1] }
  y_limit, x_limit = map.length, map[0].length

  unvisited = (0...y_limit).flat_map do |y|
    (0...x_limit).map {|x| [y, x] }
  end.to_set
  regions = []
  until unvisited.empty?
    start = unvisited.first
    sym = map[start[0]][start[1]]
    perim = 0
    area = 0
    to_visit = [start]
    while cell = to_visit.pop
      if unvisited.include? cell
        unvisited.delete cell
        friends = neighbors(cell, [y_limit, x_limit]).filter {|y, x| map[y][x] == sym }
        perim += 4 - friends.length
        area += 1
        to_visit += friends
      end
    end
    regions << [start, sym, perim, area]
  end

  [
    regions.sum {|_, _, perim, area| perim * area },
    0,
  ]
end
