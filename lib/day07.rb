private def possible?(operators, test, total, operands, i)
  if operand = operands[i]
    operators.any? do |operator|
      res = operator.call(total, operand)
      res <= test && possible?(operators, test, res, operands, i+1)
    end
  else
    test == total
  end
end

def day07(lines)
  equations = lines.map do |l|
    l.split(" ").map(&:to_i)
  end

  add = ->(a, b) { a + b }
  mul = ->(a, b) { a * b }
  concat = ->(a, b) do
    b + (a * case b
      when ...10
        10
      when ...100
        100
      when ...1000
        1000
      when ...10000
        10000
      when ...100000
        100000
      when ...1000000
        1000000
      when ...10000000
        10000000
      when ...100000000
        100000000
      when ...1000000000
        1000000000
      when ...10000000000
        10000000000
      when ...100000000000
        100000000000
      when ...1000000000000
        1000000000000
      else raise :concat_overflow
    end)
  end

  [
    [add, mul],
    [add, mul, concat],
  ].map do |operators|
    equations.filter {|e| possible?(operators, e[0], e[1], e, 2) }.sum(&:first)
  end
end
