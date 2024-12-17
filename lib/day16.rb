require 'util'

def djikstra_all_opt(start)
  to_visit = PQueue.new([[0, start, []]]) {|(a, _, _), (b, _, _)| a < b }
  visited = {}
  while entry = to_visit.pop
    cost, node, path = entry
    if visited.include? node
      old_cost, old_paths = visited[node]
      next unless cost == old_cost
      old_paths << path
    else
      visited[node] = [cost, [path]]
    end
    
    forward_path = path + [node]
    (yield node).each do |forward_cost, forward|
      unless visited.include? forward
        to_visit << [cost + forward_cost, forward, forward_path]
      end
    end
  end
  visited
end

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

  res = djikstra([:e, t_start]) do |dir, (y, x)|
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

  all_res = djikstra_all_opt([:e, t_start]) do |dir, (y, x)|
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
  _, all_paths = %i(n e s w).map do |dir|
    cost, paths = all_res[[dir, t_end]]
    [cost, paths.map{|p| p + [[dir, t_end]] }]
  end.min_by {|cost, _| cost }

  [
    %i(n e s w).map {|dir| res[[dir, t_end]][0] }.min,
    all_paths.flat_map {|path| path.map {|_, pos| pos } }.uniq.count,
  ]
end

