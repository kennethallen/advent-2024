ptn = /^(\d+)\s+(\d+)$/
lines = File.foreach("data/01.txt").map {|line| ptn.match(line)[1..2].map(&:to_i) }

lists = (0..1).map {|i| lines.map {|line| line[i] } }
lists.each(&:sort!)
puts lists[0].zip(lists[1]).map {|vals| (vals[0] - vals[1]).abs }.sum

l1_counts = Hash.new(0)
lists[1].each {|n| l1_counts[n] += 1 }
puts lists[0].map {|n| n * l1_counts[n] }.sum
