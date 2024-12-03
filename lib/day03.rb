def day03(lines)
  muls = lines.flat_map do |l|
    l.scan(/mul\((\d{1,3}),(\d{1,3})\)/)
  end.map do |m|
    m.map(&:to_i).inject(:*)
  end

  [
    muls.sum,
    0,
  ]
end
