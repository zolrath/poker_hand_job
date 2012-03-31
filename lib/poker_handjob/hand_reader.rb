require_relative 'card_dealer'

class HandReader
  attr_accessor :hand
  def initialize(cards)
    @hand = cards.sort
  end

  def self.read(hand)
    hand = HandReader.new(hand)
    return "Straight Flush" if hand.is_straight_flush?
    return "Four of a Kind" if hand.is_four_of_a_kind?
    return "Full House" if hand.is_full_house?
    return "Flush" if hand.is_flush?
    return "Straight" if hand.is_straight?
    return "Three of a Kind" if hand.is_three_of_a_kind?
    return "Two Pair" if hand.is_two_pair?
    return "One Pair" if hand.is_one_pair?
    return "High Card: #{hand.high_card}"
  end

  def high_card
    hand.last
  end

  def is_one_pair?
    card_groups = hand.reduce(Hash.new(0)) { |hash,card| hash[card.value] +=1; hash }
    card_groups.each do |type, frequency|
      return true if frequency == 2
    end
    false
  end

  def is_two_pair?
    pair_count = 0
    card_groups = hand.reduce(Hash.new(0)) { |hash,card| hash[card.value] +=1; hash }
    card_groups.each do |type, frequency|
      pair_count += 1 if frequency == 2
    end
    return true if pair_count == 2
    false
  end

  def is_three_of_a_kind?
    card_groups = hand.reduce(Hash.new(0)) { |hash,card| hash[card.value] +=1; hash }
    card_groups.each do |type, frequency|
      return true if frequency == 3
    end
    false
  end

  def is_straight?
    values = hand.map(&:value)
    if values.last == 14
      return true if values == [2, 3, 4, 5, 14]
    end
    return true if values == [*hand.first.value..hand.first.value+4]
    false
  end

  def is_flush?
    suits = hand.map(&:suit)
    return true if (suits.uniq!.count == 1)
    false
  end

  def is_full_house?
    three_match = false
    two_match = false
    card_groups = hand.reduce(Hash.new(0)) { |hash,card| hash[card.value] +=1; hash }
    card_groups.each do |type, frequency|
      three_match = type if frequency == 3
      two_match = true if frequency == 2
    end
    return true if two_match == true && three_match != false
    false
  end

  def is_four_of_a_kind?
    card_groups = hand.reduce(Hash.new(0)) { |hash,card| hash[card.value] +=1; hash }
    card_groups.each do |type, frequency|
      return true if frequency == 4
    end
    false
  end

  def is_straight_flush?
    suits = hand.map(&:suit).uniq!.count
    values = hand.map(&:value)
    if values.last == 14
      return true if values == [2, 3, 4, 5, 14] && suits == 1
    end
    return true if suits == 1 && values == [*hand.first.value..hand.first.value+4]
    false
  end
end
