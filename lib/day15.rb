def step15((y, x), move, (y_limit, x_limit))
  case move
  when "<"
    [y, x-1] if x > 0
  when ">"
    [y, x+1] if x+1 < x_limit
  when "^"
    [y-1, x] if y > 0
  when "v"
    [y+1, x] if y+1 < y_limit
  end
end

def day15(lines)
  map, moves = lines.slice_after(/^$/).map(&:to_a)
  robot = nil
  map = map[1...-2].each_with_index.map do |r, y|
    r[1...-2].each_char.each_with_index.map do |c, x|
      case c
      when "O"
        :box
      when "#"
        :wall
      when "@"
        robot = [y, x]
        nil
      end
    end
  end
  moves = moves.map {|m| m[...-1] }.join
  dims = [map.length, map[0].length]

  moves.each_char do |move|
    dest = robot
    first_step = nil
    while (dest = step15(dest, move, dims)) && map[dest[0]][dest[1]] != :wall
      first_step ||= dest
      unless map[dest[0]][dest[1]]
        map[dest[0]][dest[1]] = :box
        map[first_step[0]][first_step[1]] = nil
        robot = first_step
        break
      end
    end
=begin
    map.each_with_index do |r, y|
      r.each_with_index do |c, x|
        print case when robot == [y, x] then "@" when c == :box then "O" when c == :wall then "#" else "." end
      end
      puts
    end
    puts
=end
  end

  [
    map.each_with_index.flat_map do |r, y|
      r.each_with_index.map do |c, x|
        x+1 + 100*(y+1) if c == :box
      end
    end.compact.sum,
    0,
  ]
end
