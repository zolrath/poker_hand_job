require_relative '../../lib/poker_handjob/hand_reader'


describe "HandReader" do
  let(:deck) { Deck.please }
  let(:high_card_deck) do
    new_deck = Deck.new
    new_deck.add_card(Card.new(5, "Hearts")).add_card(Card.new(4, "Spades")).add_card(Card.new(10, "Diamonds")).
      add_card(Card.new("King", "Spades")).add_card(Card.new(2, "Diamonds"))
  end
  let(:one_pair_deck) do
    new_deck = Deck.new
    new_deck.add_card(Card.new(4, "Hearts")).add_card(Card.new(4, "Spades")).add_card(Card.new(10, "Diamonds")).
             add_card(Card.new("King", "Spades")).add_card(Card.new(2, "Diamonds"))
  end
  let(:two_pair_deck) do
    new_deck = Deck.new
    new_deck.add_card(Card.new(4, "Hearts")).add_card(Card.new(4, "Spades")).add_card(Card.new(10, "Diamonds")).
      add_card(Card.new("King", "Spades")).add_card(Card.new(10, "Diamonds"))
  end
  let(:three_of_a_kind_deck) do
    new_deck = Deck.new
    new_deck.add_card(Card.new(4, "Hearts")).add_card(Card.new(4, "Spades")).add_card(Card.new(4, "Diamonds")).
      add_card(Card.new("King", "Spades")).add_card(Card.new(2, "Diamonds"))
  end
  let(:straight_deck) do
    new_deck = Deck.new
    new_deck.add_card(Card.new("Ace", "Hearts")).add_card(Card.new(2, "Spades")).add_card(Card.new(3, "Diamonds")).
      add_card(Card.new(4, "Spades")).add_card(Card.new(5, "Diamonds"))
  end
  let(:flush_deck) do
    new_deck = Deck.new
    new_deck.add_card(Card.new(4, "Spades")).add_card(Card.new(4, "Spades")).add_card(Card.new(4, "Spades")).
      add_card(Card.new("King", "Spades")).add_card(Card.new(2, "Spades"))
  end
  let(:full_house_deck) do
    new_deck = Deck.new
    new_deck.add_card(Card.new(4, "Hearts")).add_card(Card.new(4, "Spades")).add_card(Card.new(4, "Diamonds")).
      add_card(Card.new(2, "Spades")).add_card(Card.new(2, "Diamonds"))
  end
  let(:four_of_a_kind_deck) do
    new_deck = Deck.new
    new_deck.add_card(Card.new(4, "Hearts")).add_card(Card.new(4, "Spades")).add_card(Card.new(4, "Diamonds")).
      add_card(Card.new("King", "Spades")).add_card(Card.new(4, "Diamonds"))
  end
  let(:straight_flush_deck) do
    new_deck = Deck.new
    new_deck.add_card(Card.new(10, "Diamonds")).add_card(Card.new("Jack", "Diamonds")).add_card(Card.new("Queen", "Diamonds")).
      add_card(Card.new("King", "Diamonds")).add_card(Card.new("Ace", "Diamonds"))
  end

  it "can identify the High Card" do
    HandReader.new(high_card_deck).high_card.should == Card.new("King", "Spades")
  end
  it "can identify One Pair" do
    HandReader.new(one_pair_deck).is_one_pair?.should be_true
  end
  it "can identify Two Pair" do
    HandReader.new(two_pair_deck).is_two_pair?.should be_true
  end
  it "can identify Three of a Kind" do
    HandReader.new(three_of_a_kind_deck).is_three_of_a_kind?.should be_true
  end
  it "can identify a Straight" do
    HandReader.new(straight_deck).is_straight?.should be_true
  end
  it "can identify a Flush" do
    HandReader.new(flush_deck).is_flush?.should be_true
  end
  it "can identify a Full House" do
    HandReader.new(full_house_deck).is_full_house?.should be_true
  end
  it "can identify Four of a Kind" do
    HandReader.new(four_of_a_kind_deck).is_four_of_a_kind?.should be_true
  end
  it "can identify a Straight Flush" do
    HandReader.new(straight_flush_deck).is_straight_flush?.should be_true
  end

  it "can identify the best hand as a Straight Flush" do
    HandReader.read(straight_flush_deck).should == "Straight Flush"
  end
  it "can identify the best hand as Four of a Kind" do
    HandReader.read(four_of_a_kind_deck).should == "Four of a Kind"
  end
  it "can identify the best hand as a Full House" do
    HandReader.read(full_house_deck).should == "Full House"
  end
  it "can identify the best hand as a Flush" do
    HandReader.read(flush_deck).should == "Flush"
  end
  it "can identify the best hand as a Straight" do
    HandReader.read(straight_deck).should == "Straight"
  end
  it "can identify the best hand as Three of a Kind" do
    HandReader.read(three_of_a_kind_deck).should == "Three of a Kind"
  end
  it "can identify the best hand as Two Pair" do
    HandReader.read(two_pair_deck).should == "Two Pair"
  end
  it "can identify the best hand as One Pair" do
    HandReader.read(one_pair_deck).should == "One Pair"
  end
  it "can identify the best hand as the High Card" do
    HandReader.read(high_card_deck).should == "High Card: A King of Spades"
  end
end

