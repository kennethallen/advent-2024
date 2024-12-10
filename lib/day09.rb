def day09(lines)
  data = []
  lines.first.each_char.each_with_index do |n, i|
    data += [(i/2 if i.even?)] * n.to_i
  end

  i = 0
  while i < data.length
    unless data[i]
      data[i] = loop do
        moved = data.pop
        break moved if moved
      end
    end
    i += 1
  end

  [
    data.each_with_index.sum {|d, i| d * i },
    0,
  ]
end
