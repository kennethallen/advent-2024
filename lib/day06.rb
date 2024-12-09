private def step((y, x), dir, (y_bound, x_bound))
  case dir
  when :n
    [y-1, x] if y > 0
  when :s
    [y+1, x] if y+1 < y_bound
  when :e
    [y, x+1] if x+1 < x_bound
  when :w
    [y, x-1] if x > 0
  end
end

private def turn_right(dir)
  case dir
  when :n
    :e
  when :s
    :w
  when :e
    :s
  when :w
    :n
  end
end

private def start_pos(lines)
  lines.each_with_index do |l, y|
    l.each_char.each_with_index do |c, x|
      if c == "^"
        return y, x
      end
    end
  end
end

private def walk(walls, dims, pos, dir)
  history = Hash.new {|h, k| h[k] = Set.new }
  until history[pos].include? dir
    history[pos] << dir

    pos = loop do
      forward = step(pos, dir, dims)
      return history, :edge if !forward
      break forward unless walls.include? forward
      dir = turn_right(dir)
    end
  end
  [history, :loop]
end

def day06(lines)
  lines = lines.to_a
  dims = [lines.length, lines.empty? ? 0 : lines[0].length - 1]
  walls = lines.each_with_index.flat_map do |l, y|
    l.each_char.each_with_index.filter_map {|c, x| [y, x] if lines[y][x] == "#" }
  end.to_set
  pos = start_pos(lines)

  history, _ = walk(walls, dims, pos, :n)
  [
    history.length,
    history.keys.count do |new_wall|
      walk(walls | [new_wall], dims, pos, :n)[1] == :loop
    end,
  ]
end
