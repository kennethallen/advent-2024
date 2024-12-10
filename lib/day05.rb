private def score(updates) = updates.sum {|u| u[u.length / 2] }

def day05(lines)
  rules_lines, _, updates_lines = lines.slice_when {|b, a| [b, a].include? "\n" }.to_a

  rules = rules_lines.map do |l|
    /^(\d+)\|(\d+)$/.match(l)[1..2].map(&:to_i)
  end.to_set

  updates = updates_lines.map do |l|
    l.split(',').map(&:to_i)
  end

  right, wrong = updates.partition do |u|
    page_nums = u.each_with_index.to_h
    rules.all? do |r|
      r.map {|n| page_nums[n] }.compact.each_cons(2).all? {|a, b| a < b }
    end
  end

  wrong.each do |u|
    loop do
      changed = false
      (0...u.length).each do |i|
        (i+1...u.length).each do |j|
          if rules.include? [u[j], u[i]]
            u[i], u[j] = u[j], u[i]
            changed = true
          end
        end
      end
      break if !changed
    end
  end

  [right, wrong].map {|u| score u }
end
