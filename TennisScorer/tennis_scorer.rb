#---
# Excerpted from "Programming Ruby",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ruby3 for more book information.
#---
class TennisScorer

  OPPOSITE_SIDE_OF_NET = {
    :server => :receiver,
    :receiver => :server
  }

  def initialize
    @points = { :server => 0, :receiver => 0 }
  end

  def score
    s = @points[:server]
    r = @points[:receiver]

    if s <= 3 && r <= 3 && s + r < 6
	numeric_score_for s, r
    else
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
  end

  def give_point_to(player)
    other = OPPOSITE_SIDE_OF_NET[player]
    fail "Unknown player #{player}" unless other
    @points[player] += 1
  end

  private
  def numeric_score_for(s, r)
    return "#{numeric_for s}-#{numeric_for r}"
  end

  def numeric_for(points)
    foo = points * 15
    foo -= 5 if points == 3
    foo
  end
end