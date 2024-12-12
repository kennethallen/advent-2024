def day12(lines)
  map = lines.map {|l| l[...-1] }
  dims = map.length, map[0].length

  unvisited = (0...dims[0]).flat_map do |y|
    (0...dims[1]).map {|x| [y, x] }
  end.to_set
  regions = []
  until unvisited.empty?
    start = unvisited.first
    sym = map[start[0]][start[1]]
    area = 0
    walls = Set.new
    to_visit = [start]
    while cell = to_visit.pop
      if unvisited.include? cell
        unvisited.delete cell
        to_visit += friends = neighbors(cell, dims).filter {|y, x| map[y][x] == sym }
        area += 1
        y, x = cell
        walls += [
          ([y, x  , :v] unless friends.include? [y, x-1]),
          ([y, x+1, :v] unless friends.include? [y, x+1]),
          ([x, y  , :h] unless friends.include? [y-1, x]),
          ([x, y+1, :h] unless friends.include? [y+1, x]),
        ].compact
      end
    end
    wall_count = walls.count do |parallel, perp, dir|
      !walls.include?([parallel+1, perp, dir]) || begin
        other_dir = case dir when :h then :v else :h end
        (perp-1..perp).all? {|perp0| walls.include? [perp0, parallel+1, other_dir] }
      end
    end
    regions << [start, sym, walls.length, area, wall_count]
  end

  [
    regions.sum {|_, _, perim, area, _| perim * area },
    regions.sum {|_, _, _, area, wall_count| wall_count * area },
  ]
end
