private def sum_ints(a, b) = (b*b - b - (a*a - a))/2
private def score09(data)
  i = 0
  csum = 0
  data.each do |d, n|
    csum += d * sum_ints(i, i+n) if d
    i += n
  end
  csum
end

private def blockwise(data)
  data.pop until data.last[0]
  i = 0
  while i < data.length
    d, n = data[i]
    unless d
      last_d, last_n = data.pop
      data.pop until data.last[0]
      if n == last_n
        data[i] = [last_d, last_n]
      elsif n > last_n
        data[i..i] = [[last_d, last_n], [nil, n - last_n]]
      else
        data[i] = [last_d, n]
        data.push [last_d, last_n - n]
      end
    end
    i += 1
  end
  data
end

private def filewise(data)
  (0..data.last[0]).reverse_each do |d|
    (_, n), i = data.each_with_index.find {|(d0, _), _| d == d0 }
    (_, empty_n), empty_i = data[..i].each_with_index.find {|(d0, n0), _| d0.nil? && n0 >= n }
    if empty_i
      if empty_n > n
        data[empty_i..empty_i] = [[nil, n], [nil, empty_n - n]]
        i += 1
      end
      data[i], data[empty_i] = data[empty_i], data[i]

      next_d, next_n = data[i+1]
      if next_n && next_d.nil?
        data[i..i+1] = [[nil, next_n + data[i][1]]]
      end
      prev_d, prev_n = data[i-1]
      if prev_n && prev_d.nil?
        data[i-1..i] = [[nil, prev_n + data[i][1]]]
      end
    end
  end
  data
end

def day09(lines)
  data = lines.first.each_char.each_with_index.filter_map do |n, i|
    [(i/2 if i.even?), n.to_i] if n.to_i > 0
  end

  [blockwise(data.dup), filewise(data.dup)].map {|d| score09 d }
end
