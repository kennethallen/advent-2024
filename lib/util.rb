def neighbors((y, x), (y_limit, x_limit))
  [
    ([y-1, x] if y > 0),
    ([y+1, x] if y+1 < y_limit),
    ([y, x-1] if x > 0),
    ([y, x+1] if x+1 < x_limit),
  ].compact
end

def count(xs)
  c = Hash.new 0
  xs.each {|x| c[x] += 1 }
  c
end
