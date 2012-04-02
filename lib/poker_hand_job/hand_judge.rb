class HandJudge
  attr_accessor :hands
  def initialize(hands)
    @hands = hands
  end

  def self.judge(*hands)
    judgement = HandJudge.new(Array(hands))
    judgement.rank
  end

  def rank
    @hands.sort!
    self
  end

  def winner
    @hands.last
  end

  def to_s
    "The winning hand was a #{winner.type}! Boldly claimed with #{winner.hand}"
  end
end
