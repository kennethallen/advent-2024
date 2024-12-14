def day14(lines)
  dims = /(\d+) (\d+)/.match(lines.first)[1..].map(&:to_i)
  robots = lines[1..].map do |l|
    /p=(-?\d+),(-?\d+) v=(-?\d+),(-?\d+)/.match(l)[1..].map(&:to_i)
  end

  p dims, robots

  [
    0,
    0,
  ]
end
