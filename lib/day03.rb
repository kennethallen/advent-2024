def day03(lines)
  ptn = /(?<fn>do)\(\)|(?<fn>don't)\(\)|(?<fn>mul)\((?<a0>\d{1,3}),(?<a1>\d{1,3})\)/
  instrs = lines.flat_map do |l|
    l.to_enum(:scan, ptn).map do
      m = Regexp.last_match
      case m[:fn]
      when "do"
        [:do]
      when "don't"
        [:dont]
      when "mul"
        [:mul, (0..1).map {|n| m["a#{n}"].to_i }.reduce(:*)]
      end
    end
  end

  [
    instrs.sum {|instr, n| instr == :mul ? n : 0 },
    instrs.reduce([true, 0]) do |(enabled, sum), (instr, n)|
      case instr
      when :do
        [true, sum]
      when :dont
        [false, sum]
      when :mul
        [enabled, enabled ? sum + n : sum]
      end
    end[1],
  ]
end
