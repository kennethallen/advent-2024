def day05(lines)
  rules_lines, _, updates_lines = lines.slice_when {|b, a| [b, a].include? "\n" }.to_a

  rules = rules_lines.map do |l|
    /^(\d+)\|(\d+)$/.match(l)[1..2].map(&:to_i)
  end

  updates = updates_lines.map do |l|
    l.split(',').map(&:to_i)
  end

  [
    updates.filter do |u|
      page_nums = Hash[u.each_with_index.to_a]
      rules.all? do |r|
        r.map {|n| page_nums[n] }.compact.each_cons(2).all? {|a, b| a < b }
      end
    end.sum {|u| u[u.length / 2] },
    0,
  ]
end