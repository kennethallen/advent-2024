require 'util'

class Pather16
  include AStar

  def initialize(walls, t_end)
    @walls = walls
    @t_end = t_end
  end

  def terminal?((_, pos)) = pos == @t_end

  def heuristic((dir, (y, x)))
    return 0
    ty, tx = @t_end
    (y - ty).abs + (x - tx).abs + (case dir
    when :n
      if y < ty
        2000
      elsif x != tx
        1000
      end
    when :s
      if y > ty
        2000
      elsif x != tx
        1000
      end
    when :e
      if x > tx
        2000
      elsif y != ty
        1000
      end
    when :w
      if x < tx
        2000
      elsif y != ty
        1000
      end
    end || 0)
  end

  def nexts((dir, (y, x)))
    nexts = [
      case dir
      when :e then :n
      when :n then :w
      when :w then :s
      when :s then :e
      end,
      case dir
      when :e then :s
      when :n then :e
      when :w then :n
      when :s then :w
      end,
    ].map {|d| [1_000, [d, [y, x]]] }
    sy, sx = case dir
    when :e
      [y, x+1]
    when :w
      [y, x-1]
    when :n
      [y-1, x]
    when :s
      [y+1, x]
    end
    nexts << [1, [dir, [sy, sx]]] unless @walls[sy][sx]
    nexts
  end
end

def day16(lines)
  t_start = nil
  t_end = nil
  walls = lines.each_with_index.map do |l, y|
    l[...-1].each_char.each_with_index.map do |c, x|
      case c
      when "#"
        :wall
      when "S"
        t_start = [y, x]
        nil
      when "E"
        t_end = [y, x]
        nil
      end
    end
  end

  pather = Pather16.new(walls, t_end)

  [
    begin
      res_end, res = pather.path [:e, t_start]
      res[res_end][0]
    end,
    begin
      res_ends, res = pather.path_all [:e, t_start]

      res_ends.flat_map do |res_end|
        _, paths = res[res_end]
        [res_end] + paths.flat_map {|path| path }
      end.map {|_, pos| pos }.uniq.count
    end,
  ]
end

