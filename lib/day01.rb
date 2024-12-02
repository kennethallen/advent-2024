def day01(lines)
  lines = lines.map do |l|
    /^(\d+)\s+(\d+)$/.match(l)[1..2].map(&:to_i)
  end

  lists = (0..1).map do |i|
    lines.map {|l| l[i] }.sort!
  end

  l1_counts = Hash.new(0)
  lists[1].each do |n|
    l1_counts[n] += 1
  end

  [
    lists[0].zip(lists[1]).map {|v0, v1| (v0 - v1).abs }.sum,
    lists[0].map {|n| n * l1_counts[n] }.sum,
  ]
end
