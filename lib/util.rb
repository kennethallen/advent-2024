require 'pqueue'

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

def djikstra(start)
  to_visit = PQueue.new([[0, start, []]]) {|(a, _, _), (b, _, _)| a < b }
  visited = {}
  while entry = to_visit.pop
    cost, node, path = entry
    unless visited.include? node
      visited[node] = [cost, path]
      forward_path = path + [node]
      (yield node).each do |forward_cost, forward|
        unless visited.include? forward
          to_visit << [cost + forward_cost, forward, forward_path]
        end
      end
    end
  end
  visited
end
