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
  loop_wall_count = 0
  loop_wall_tested = Set.new
  loop do
    next_pos = loop do
      forward = step(pos, dir, dims)
      return history, :edge, loop_wall_count unless forward
      break forward unless walls.include? forward
      dir = turn_right(dir)
    end
    unless loop_wall_tested.include? next_pos
      loop_wall_tested << next_pos
      if walk_inner(history.dup, walls | [next_pos], dims, pos, dir) == :loop
        loop_wall_count += 1
      end
    end
    pos = next_pos

    break if history[pos].include? dir
    history[pos] << dir
  end
  [history, :loop, loop_wall_count]
end

private def walk_inner(history, walls, dims, pos, dir)
  loop do
    pos = loop do
      forward = step(pos, dir, dims)
      return :edge unless forward
      break forward unless walls.include? forward
      dir = turn_right(dir)
    end

    break if history[pos].include? dir
    history[pos] |= [dir]
  end
  :loop
end

def day06(lines)
  lines = lines.to_a
  dims = [lines.length, lines.empty? ? 0 : lines[0].length - 1]
  walls = lines.each_with_index.flat_map do |l, y|
    l.each_char.each_with_index.filter_map {|c, x| [y, x] if lines[y][x] == "#" }
  end.to_set
  pos = start_pos(lines)

  history, _, loop_count = walk(walls, dims, pos, :n)
  p loop_count
  [
    history.length,
    loop_count,
  ]
end
