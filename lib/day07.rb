private def possible?(test, total, operands, i)
  if operand = operands[i]
    sum = total + operand
    prod = total * operand
    (sum <= test && possible?(test, sum, operands, i+1)) ||
      (prod <= test && possible?(test, prod, operands, i+1))
  else
    test == total
  end
end

def day07(lines)
  equations = lines.map do |l|
    l.split(" ").map(&:to_i)
  end

  [
    equations.filter {|e| possible?(e[0], e[1], e, 2) }.sum(&:first),
    0,
  ]
end
