class TennisScorer

  OPPOSITE_SIDE_OF_NET = {
    :server => :receiver,
    :receiver => :server
  }

  def initialize
    @points = { :server => 0, :receiver => 0 }
  end

  def score
    s, r = @points[:server], @points[:receiver]
    if s <= 3 && r <= 3 && s + r < 6
      numeric_score_for s, r
    else
      alpha_score_for s, r 
    end
  end

  def give_point_to(player)
    other = OPPOSITE_SIDE_OF_NET[player]
    fail "Unknown player #{player}" unless other
    @points[player] += 1
  end

  private
  def alpha_score_for(s, r)
    case
      when s == r
        "Deuce"
      when s - r == 1
        "A-server"
      when r - s == 1
        "A-receiver"
      when s - r > 1
        "W-L"
      when r - s > 1
        "L-W"
      end
  end

  def numeric_score_for(s, r)
    return "#{numeric_for s}-#{numeric_for r}"
  end

  def numeric_for(points)
    points * 15 - (points == 3 ? 5 : 0)
  end
end