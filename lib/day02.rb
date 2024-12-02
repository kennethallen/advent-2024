private def safe?(report)
  deltas = report.each_cons(2).map {|a, b| a - b }
  [(1..3), (-3..-1)].any? do |range|
    deltas.all? {|d| range === d }
  end
end

private def safe_tolerant?(report)
  safe?(report) ||
  (0...report.count).any? do |i|
    safe?(report[...i].concat(report[i+1..]))
  end
end

def day02(lines)
  reports = lines.map do |l|
    l.split(" ").map(&:to_i)
  end

  [
    reports.filter {|r| safe?(r) }.count,
    reports.filter {|r| safe_tolerant?(r) }.count,
  ]
end
