private def step15((y, x), move)
  case move
  when "<"
    [y, x-1]
  when ">"
    [y, x+1]
  when "^"
    [y-1, x]
  when "v"
    [y+1, x]
  end
end

private def sim15(map_data, moves)
  map = map_data[...-1].map do |r|
    r[...-1].each_char.flat_map do |c|
      yield c
    end
  end
  robot = map.each_with_index.flat_map do |r, y|
    r.each_with_index.filter_map do |c, x|
      [y, x] if c == :robot
    end
  end.first

  moves.each_char do |move|
    catch(:exit) do
      to_assess = [robot]
      plan = {}
      while curs = to_assess.pop
        next if plan.include? curs
        next unless cell = map[curs[0]][curs[1]]
        plan[curs] = cell
        dest = step15(curs, move)
        to_assess += [dest] + case cell
        when :wall
          throw :exit
        when :robot, :box
          []
        when :box_l
          [[curs[0], curs[1]+1]]
        when :box_r
          [[curs[0], curs[1]-1]]
        end
      end

      plan.each do |(y, x), _|
        map[y][x] = nil
      end
      plan.each do |pos, cell|
        y, x = step15(pos, move)
        map[y][x] = cell
      end
      robot = step15(robot, move)
    end
  end
  map
end

def day15(lines)
  map, moves = lines.slice_after(/^$/).map(&:to_a)
  moves = moves.map {|m| m[...-1] }.join

  [
    sim15(map, moves) do |c|
      case c
      when "O"
        [:box]
      when "#"
        [:wall]
      when "@"
        [:robot]
      else
        [nil]
      end
    end,
    sim15(map, moves) do |c|
      case c
      when "O"
        [:box_l, :box_r]
      when "#"
        [:wall, :wall]
      when "@"
        [:robot, nil]
      else
        [nil, nil]
      end
    end,
  ].map do |map|
    map.each_with_index.flat_map do |r, y|
      r.each_with_index.map do |c, x|
        x + 100*y if [:box_l, :box].to_set === c
      end
    end.compact.sum
  end
end
