private def step_stone(s)
  if s == 0
    [1]
  elsif (num_digits = Math::log10(s).next_float.ceil).even?
    s.divmod 10**(num_digits/2)
  else
    [s*2024]
  end
end

def day11(lines)
  stones = Hash.new 0
  lines.first.split(" ").each {|s| stones[s.to_i] += 1 }

  stones25 = nil
  75.times do |i|
    stones25 = stones if i == 25
    stones_old, stones = stones, Hash.new(0)
    stones_old.each do |s, n|
      step_stone(s).each {|s| stones[s] += n }
    end
  end

  [
    stones25.values.sum,
    stones.values.sum,
  ]
end
