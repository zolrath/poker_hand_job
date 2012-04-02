require_relative 'card_dealer'

class Hand
  include Comparable
  attr_reader :type, :hand, :value, :value_name, :suit
  def initialize(type, hand, value, suit="Unimportant")
    @type=type
    @hand=hand
    @value=value
    @value_name=value_to_name(value)
    @suit=suit
  end

  def rank
   {"Straight Flush"  => 9,
    "Four of a Kind"  => 8,
    "Full House"      => 7,
    "Flush"           => 6,
    "Straight"        => 5,
    "Three of a Kind" => 4,
    "Two Pair"        => 3,
    "One Pair"        => 2,
    "High Card"       => 1}.fetch(type, 0)
  end

  def value_to_name(value)
    case value
    when 14 then "Ace"
    when 13 then "King"
    when 12 then "Queen"
    when 11 then "Jack"
    else value.to_s
    end
  end

  def to_s
    "A #{type}!"
  end

  def high_card
    hand.last
  end

  def <=>(other)
    [self.rank, self.value] <=> [other.rank, other.value]
  end
end

class HandReader
  attr_accessor :hand
  def initialize(cards)
    @hand = cards.sort
  end

  def self.read(hand)
    hand = HandReader.new(hand)
    hands = ["is_straight_flush?","is_four_of_a_kind?","is_full_house?",
             "is_flush?","is_straight?","is_three_of_a_kind?",
             "is_two_pair?","is_one_pair?","is_high_card?"]
    hands.each{ |is_hand| return hand.send(is_hand) if hand.send(is_hand) }
  end

  def suit
    hand.map(&:suit).uniq!
  end

  def values
    hand.map(&:value)
  end

  def group_cards
    hand.each_with_object(Hash.new(0)) do |card, hash|
      hash[card.value] +=1
    end
  end

  def is_high_card?
    Hand.new("High Card", hand, hand.last.value)
  end

  def is_one_pair?
    group_cards.each do |card_value, frequency|
      return Hand.new("One Pair", hand, card_value) if frequency == 2
    end
    false
  end

  def is_two_pair?
    pairs = []
    group_cards.each do |card_value, frequency|
      pairs << card_value if frequency == 2
      return Hand.new("Two Pair", hand, pairs.max) if pairs.count == 2
    end
    false
  end

  def is_three_of_a_kind?
    group_cards.each do |card_value, frequency|
      return Hand.new("Three of a Kind", hand, card_value) if frequency == 3
    end
    false
  end

  def is_straight?
    start = hand.first.value
    if values == [*start..start+4] || values == [2,3,4,5,14]
      return Hand.new("Straight", hand, values.min)
    end
    false
  end

  def is_flush?
    return Hand.new("Flush", hand, values.max, suit.first) if (suit.count == 1)
    false
  end

  def is_full_house?
    three_match = false
    two_match   = false
    group_cards.each do |card_value, frequency|
      three_match = card_value if frequency == 3
      two_match = true if frequency == 2
      if two_match == true && three_match != false
        return Hand.new("Full House", hand, three_match)
      end
    end
    false
  end

  def is_four_of_a_kind?
    group_cards.each do |card_value, frequency|
      return Hand.new("Four of a Kind", hand, card_value) if frequency == 4
    end
    false
  end

  def is_straight_flush?
    if is_straight? && is_flush?
      return Hand.new("Straight Flush", hand, values.min, suit.first)
    end
    false
  end
end
