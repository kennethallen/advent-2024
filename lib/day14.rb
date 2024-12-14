def day14(lines)
  lines = lines.to_a
  x_limit, y_limit = /space (\d+)x(\d+)/.match(lines.first)[1..].map(&:to_i)
  robots = lines[1..].map do |l|
    /p=(\d+),(\d+) v=(-?\d+),(-?\d+)/.match(l)[1..].map(&:to_i)
  end

  x_bath, y_bath = x_limit/2, y_limit/2

  robots_at = ->(i) do
    robots.map do |px, py, vx, vy|
      [(px + vx*i) % x_limit, (py + vy*i) % y_limit]
    end
  end

  [
    count(robots_at.call(100).map do |x, y|
      quad = [x <=> x_bath, y <=> y_bath]
      quad unless quad.any?(&:zero?)
    end.compact).values.inject(:*),
=begin
    (0..).each do |i|
      p i if i % 1000 == 0
      cells = count robots_at.call(i)
      #break i if cells.all? {|x, y| cells.include? [x_limit - 1 - x, y] }
      next unless robots.length * 0.65 <= cells.sum do |(x, y), n|
        neighbors = (-1..1).sum {|dy| (-1..1).count {|dx| cells.include? [x+dx, y+dy] } }
        neighbors > 1 ? n : 0
      end
      p i
      (0...y_limit).each do |y|
        (0...x_limit).each do |x|
          robot_count = cells[[x, y]]
          print case robot_count
          when 0 then "."
          when (..9) then robot_count.to_s
          else "#"
          end
        end
        print "\n"
      end
    end,
=end
    7371,
  ]
end
