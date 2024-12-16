require 'util'

def day16(lines)
  t_start = nil
  t_end = nil
  walls = lines.each_with_index.map do |l, y|
    l[...-1].each_char.each_with_index.map do |c, x|
      case c
      when "#"
        :wall
      when "S"
        t_start = [y, x]
        nil
      when "E"
        t_end = [y, x]
        nil
      end
    end
  end

  paths = djikstra([:e, t_start]) do |dir, (y, x)|
    nexts = [
      case dir
      when :e then :n
      when :n then :w
      when :w then :s
      when :s then :e
      end,
      case dir
      when :e then :s
      when :n then :e
      when :w then :n
      when :s then :w
      end,
    ].map {|d| [1_000, [d, [y, x]]] }
    sy, sx = case dir
    when :e
      [y, x+1]
    when :w
      [y, x-1]
    when :n
      [y-1, x]
    when :s
      [y+1, x]
    end
    nexts << [1, [dir, [sy, sx]]] unless walls[sy][sx]
    nexts
  end

  [
    %i(n e s w).map {|dir| paths[[dir, t_end]][0] }.min,
    0,
  ]
end

