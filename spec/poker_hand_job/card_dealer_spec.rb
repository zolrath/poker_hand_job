require_relative '../../lib/poker_hand_job/card_dealer'

describe "CardDealer" do
  context "Cards" do
    it "returns the proper value for Aces" do
      ace = Card.new('Ace','Spades')
      ace.value.should be == 14
    end
    it "returns the proper value for Kings" do
      king = Card.new('King','Hearts')
      king.value.should be == 13
    end
    it "returns the proper value for Queens" do
      queen = Card.new('Queen', 'Clubs')
      queen.value.should be == 12
    end
    it "returns the proper value for Jacks" do
      jack = Card.new('Jack', 'Diamonds')
      jack.value.should be == 11
    end
    it "returns the proper value for 10" do
      ten = Card.new(10, 'Diamonds')
      ten.value.should be == 10
    end

    it "should know that a Ace is better than a King" do
      ace = Card.new('Ace','Spades')
      king = Card.new('King','Hearts')
      ace.should be > king
    end
  end

  it "can make a proper standard deck" do
    deck = Deck.please
    deck.count.should be == 52
  end
  it "should deal five cards at a time by default" do
    deck = Deck.please
    hand = deck.deal
    hand.size.should be == 5
  end
  it "can deal a specified number of cards" do
    deck = Deck.please
    hand = deck.deal(10)
    hand.size.should be == 10
  end
  it "should give a new, shuffled deck" do
    deck_one = Deck.please
    deck_two = Deck.please
    deck_one.deal(10).should_not == deck_two.deal(10)
  end
end

