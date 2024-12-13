private def parse13(ptn, s)
  ptn.match(s)[1..].map(&:to_i)
end

def day13(lines)
  machines = lines.slice_after(/^$/).map do |but_a, but_b, prize|
    [
      parse13(/Button A: X\+(\d+), Y\+(\d+)/, but_a),
      parse13(/Button B: X\+(\d+), Y\+(\d+)/, but_b),
      parse13(/Prize: X=(\d+), Y=(\d+)/, prize),
    ]
  end

  [
    machines.sum do |(ax, ay), (bx, by), (px, py)|
      (0..100).flat_map do |a|
        (0..100).map {|b| [a, b] }
      end.filter do |a, b|
        a*ax + b*bx == px && a*ay + b*by == py
      end.map do |a, b|
        3*a + b
      end.min || 0
    end,
    0,
  ]
end
