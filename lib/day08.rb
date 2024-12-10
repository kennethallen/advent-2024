def fill(y, x, dy, dx, (y_limit, x_limit), nodes, stop_after_one)
  loop do
    break unless (0...y_limit) === (y += dy)
    break unless (0...x_limit) === (x += dx)
    nodes << [y, x]
    break if stop_after_one
  end
end

def day08(lines)
  lines = lines.to_a
  dims = [lines.length, lines[0].length-1]
  antennas = Hash.new {|h, k| h[k] = [] }
  lines.each_with_index do |l, y|
    l[...-1].each_char.each_with_index do |c, x|
      antennas[c] << [y, x] unless c == "."
    end
  end

  [true, false].map do |stop_after_one|
    nodes = Set.new
    antennas.each do |_, a|
      unless stop_after_one
        a.each {|ai| nodes << ai }
      end
      a.each_with_index do |(aiy, aix), i|
        a[i+1...a.length].each do |ajy, ajx|
          dy, dx = ajy - aiy, ajx - aix
          fill(ajy, ajx, dy, dx, dims, nodes, stop_after_one)
          fill(aiy, aix, -dy, -dx, dims, nodes, stop_after_one)
        end
      end
    end
    nodes.length
  end
end
