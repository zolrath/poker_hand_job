class Card
  include Comparable
  attr_accessor :suit, :rank
  def initialize(rank, suit)
    @suit = suit
    @rank = rank
  end

  def value
    case rank
    when "Ace"   then 14
    when "King"  then 13
    when "Queen" then 12
    when "Jack"  then 11
    else rank.to_i
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end

  alias inspect to_s

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
        new_deck.add_cards("#{rank} of #{suit}")
      end
    end
    new_deck.shuffle
    new_deck
  end

  def shuffle
    deck.shuffle!
  end

  def parse(text)
    card = text.match /(?<rank>\w+) of (?<suit>\w+)/
    return [card[:rank], card[:suit]]
  end

  def add_cards(*cards)
    cards.each do |card|
      card = parse(card)
      deck << Card.new(card[0], card[1])
    end
    self
  end

  def draw(number_of_cards=5)
    if deck.count < number_of_cards
      puts "The deck only has #{deck.count} cards left to deal!"
      return deck.pop(deck.count)
    end
    deck.pop(number_of_cards)
  end
  alias deal draw

  def count
    deck.count
  end

  def to_a
    deck
  end

  def sort
    deck.sort
  end
end
