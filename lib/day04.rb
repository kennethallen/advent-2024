def day04(lines)
  lines = lines.to_a
  dims = [lines.length, lines.map(&:length).min - 1]
  target = "XMAS"
  target1 = "MAS"

  [
    (0...dims[0]).flat_map do |x|
      (0...dims[1]).flat_map do |y|
        h_space = y+target.length <= dims[1]
        v_space = x+target.length <= dims[0]
        [
          h_space ? [lines[x][y...y+target.length]] : [],
          v_space ? [lines[x...x+target.length].map {|l| l[y] }.join] : [],
          h_space && v_space ? [(0...target.length).map {|i| lines[x+i][y+i] }.join] : [],
          h_space && v_space ? [(0...target.length).map {|i| lines[x+i][y+target.length-1-i] }.join] : [],
        ].flatten
      end
    end.count {|e| [target, target.reverse].include? e },
    
    (0..dims[0]-target1.length).sum do |x|
      (0..dims[1]-target1.length).count do |y|
        [
          (0...target1.length).map {|i| lines[x+i][y+i] }.join,
          (0...target1.length).map {|i| lines[x+i][y+target1.length-1-i] }.join,
        ].all? {|e| [target1, target1.reverse].include? e }
      end
    end,
  ]
end
