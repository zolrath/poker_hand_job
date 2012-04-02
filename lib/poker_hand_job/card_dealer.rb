class Card
  include Comparable
  attr_accessor :suit, :rank
  def initialize(rank, suit)
    @suit = suit
    @rank = rank
  end

  def inspect
    ["#{rank}, #{suit}"]
  end

  def to_s
    "A #{rank} of #{suit}"
  end

  def value
    case rank
    when "Ace"; 14
    when "King"; 13
    when "Queen"; 12
    when "Jack"; 11
    else rank.to_i
    end
  end

  def <=>(other)
    self.value <=> other.value
  end
end

class Deck
  attr_accessor :deck
  def initialize
    @deck = []
  end
  def self.please
    new_deck = Deck.new
    %w[Clubs Hearts Diamonds Spades].each do |suit|
      %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].each do |rank|
        new_deck.add_card(Card.new(rank, suit))
      end
    end
    new_deck.shuffle
    new_deck
  end

  def shuffle
    deck.shuffle!
  end

  def add_card(card)
    deck << card
    self
  end

  def count
    deck.count
  end

  def to_a
    deck
  end

  def sort
    deck.sort
  end

  def draw(number_of_cards=5)
    deck.pop(number_of_cards)
  end
  alias deal draw
end
