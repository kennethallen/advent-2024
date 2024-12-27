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

module AStar
  def nexts(state) = fail NotImplementedError
  def heuristic(state) = 0
  def terminal?(state) = false

  def path(start)
    to_visit = PQueue.new([[0, 0, start, []]]) {|(a, _, _, _), (b, _, _, _)| a < b }
    visited = {}
    while entry = to_visit.pop
      _, cost, node, path = entry
      unless visited.include? node
        visited[node] = [cost, path]
        return [node, visited] if terminal? node
        forward_path = path + [node]
        (nexts node).each do |forward_cost, forward|
          unless visited.include? forward
            to_visit << [
              cost + forward_cost + heuristic(forward),
              cost + forward_cost,
              forward,
              forward_path,
            ]
          end
        end
      end
    end
  [nil, visited]
  end

  def path_all(start)
    terms = Set.new
    optimal = nil
    to_visit = PQueue.new([[0, 0, start, []]]) {|(a, _, _, _), (b, _, _, _)| a < b }
    visited = {}
    while entry = to_visit.pop
      _, cost, node, path = entry

      break if optimal && cost > optimal
      if terminal? node
        optimal = cost
        terms << node
      end
      if visited.include? node
        old_cost, paths = visited[node]
        next unless cost == old_cost
        paths << path
      else
        visited[node] = [cost, [path]]
      end

      forward_path = path + [node]
      (nexts node).each do |forward_cost, forward|
        unless visited.include? forward
          to_visit << [
            cost + forward_cost,# + heuristic(forward),
            cost + forward_cost,
            forward,
            forward_path,
          ]
        end
      end
    end
    [terms, visited]
  end
end
