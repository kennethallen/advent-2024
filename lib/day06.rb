private def step((y, x), dir, (y_bound, x_bound))
  case dir
  when :n
    [y-1, x] unless y <= 0
  when :s
    [y+1, x] unless y+1 >= y_bound
  when :e
    [y, x+1] unless x+1 >= x_bound
  when :w
    [y, x-1] unless x <= 0
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
  throw :not_found
end

private def walk(lines, dims, pos, dir)
  history = Hash.new {|h, k| h[k] = Set.new }
  while !history[pos].include? dir
    history[pos] << dir

    forward = step(pos, dir, dims)
    return history, :edge if !forward
    if lines[forward[0]][forward[1]] == "#"
      dir = turn_right(dir)
      pos = step(pos, dir, dims)
      return history, :edge if !pos
    else
      pos = forward
    end
  end
  [history, :loop]
end

def day06(lines)
  lines = lines.to_a
  dims = [lines.length, lines.empty? ? 0 : lines[0].length - 1]
  pos = start_pos(lines)

  [
    walk(lines, dims, pos, :n)[0].length,
    0,
    #(0...dims[0]).sum do |y|
      #(0...dims[1]).count do |x|
        #return false if lines[y][x] == "#"

      #end
    #end,
  ]
end
