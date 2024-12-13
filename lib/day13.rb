private def parse13(ptn, s)
  ptn.match(s)[1..].map(&:to_i)
end

private def score13(machines)
  machines.map do |(ax, ay), (bx, by), (px, py)|
    next if ay*bx == ax*by
    b, b_rem = (ay*px - ax*py).divmod (ay*bx - ax*by)
    next unless b_rem == 0
    a, a_rem = (px - b*bx).divmod ax
    next unless a_rem == 0
    3*a + b
  end.compact.sum
end

def day13(lines)
  machines = lines.slice_after(/^$/).map do |but_a, but_b, prize|
    [
      parse13(/Button A: X\+(\d+), Y\+(\d+)/, but_a),
      parse13(/Button B: X\+(\d+), Y\+(\d+)/, but_b),
      parse13(/Prize: X=(\d+), Y=(\d+)/, prize),
    ]
  end

  machines_big = machines.map do |a, b, p|
    [a, b, p.map {|n| n + 10_000_000_000_000 }]
  end

  [machines, machines_big].map {|m| score13 m }
end
