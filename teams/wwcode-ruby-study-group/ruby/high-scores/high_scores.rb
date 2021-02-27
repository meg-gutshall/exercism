class HighScores
  def initialize(scores)
    @scores=scores
  end
  
  def scores
    @scores
  end

  def latest
    @scores.pop
  end

  def personal_best
    @scores.sort!.pop
  end

  def personal_top_three
    @scores.sort!.pop(3).reverse
  end

  def latest_is_personal_best?
    latest = @scores.pop
    latest > personal_best ? true : false
  end
end