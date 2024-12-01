

ptn = /^(\d+)\s+(\d+)$/

lines = File.foreach("data/01.txt").map {|line| ptn.match(line)[1..2].map(&:to_i) }
lists = (0..1).map

