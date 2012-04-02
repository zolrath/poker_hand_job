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
    hands.sort!.reverse!
    self
  end

  def results
    puts "Results:"
    hands.each_with_index do |hand,index|
      puts "#{index+1}: #{hand.type}:#{hand.value_name}"
    end
    self
  end

  def winner
    hands.first
  end

  def to_s
    "The winning hand was a #{winner.type}! Boldly claimed with #{winner.hand}"
  end
end
