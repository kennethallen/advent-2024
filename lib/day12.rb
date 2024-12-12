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
    walls = Set.new
    to_visit = [start]
    while cell = to_visit.pop
      if unvisited.include? cell
        unvisited.delete cell
        friends = neighbors(cell, [y_limit, x_limit]).filter {|y, x| map[y][x] == sym }
        perim += 4 - friends.length
        area += 1
        y, x = cell
        walls += [
          ([y, x  , :v] unless friends.include? [y, x-1]),
          ([y, x+1, :v] unless friends.include? [y, x+1]),
          ([x, y  , :h] unless friends.include? [y-1, x]),
          ([x, y+1, :h] unless friends.include? [y+1, x]),
        ].compact
        to_visit += friends
      end
    end
    wall_count = walls.count do |parallel, perp, dir|
      [
        !walls.include?([parallel+1, perp, dir]),
        begin
          other_dir = case dir when :h then :v else :h end
          (perp-1..perp).all? {|perp0| walls.include? [perp0, parallel+1, other_dir] }
        end,
      ].any?
    end
    regions << [start, sym, perim, area, wall_count]
  end

  [
    regions.sum {|_, _, perim, area, _| perim * area },
    regions.sum {|_, _, _, area, wall_count| wall_count * area },
  ]
end
