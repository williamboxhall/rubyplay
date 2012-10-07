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
    @score = { :server => 0, :receiver => 0 }
  end

  def score
    case
    when @score[:server] > 2 && @score[:server] == @score[:receiver]
      "Deuce"
    when @score[:server] > 2 && @score[:server] - @score[:receiver] == 1
      "A-server"
    when @score[:server] > 2 && @score[:server] - @score[:receiver] == -1
      "A-receiver"
    when @score[:server] > 3
      "W-L"
    when @score[:receiver] > 3
      "L-W"
    else
      "#{numeric_score_for :server}-#{numeric_score_for :receiver}"
    end
  end

  def give_point_to(player)
    other = OPPOSITE_SIDE_OF_NET[player]
    fail "Unknown player #{player}" unless other
    @score[player] += 1
  end

  private 
  def numeric_score_for(player)
    foo = @score[player] * 15
    foo -= 5 if @score[player] == 3
    foo
  end
end