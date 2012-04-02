require_relative '../../lib/poker_hand_job/hand_reader'

describe "HandReader" do
  let(:deck) { Deck.please }
  let(:high_card_deck) { Deck.new.add_cards("5 of Hearts", "4 of Spades", "10 of Diamonds", "King of Spades", "2 of Clubs") }
  let(:one_pair_deck) { Deck.new.add_cards("6 of Hearts", "6 of Spades", "10 of Diamonds","King of Spades", "2 of Diamonds") }
  let(:one_pair_deck_low) { Deck.new.add_cards("3 of Hearts", "3 of Spades", "10 of Diamonds", "King of Spades", "2 of Diamonds") }
  let(:two_pair_deck) { Deck.new.add_cards("4 of Hearts", "4 of Spades", "10 of Diamonds", "King of Spades", "10 of Hearts") }
  let(:three_of_a_kind_deck) { Deck.new.add_cards("4 of Hearts", "4 of Clubs", "Ace of Diamonds", "King of Spades", "4 of Diamonds") }
  let(:straight_deck) { Deck.new.add_cards("Ace of Hearts", "2 of Spades", "3 of Diamonds", "4 of Spades", "5 of Hearts") }
  let(:flush_deck) { Deck.new.add_cards("4 of Spades", "2 of Spades", "9 of Spades", "6 of Spades", "King of Spades") }
  let(:full_house_deck) { Deck.new.add_cards("King of Hearts", "King of Spades", "2 of Clubs", "King of Diamonds", "2 of Spades") }
  let(:full_house_deck_low) { Deck.new.add_cards("3 of Hearts", "3 of Spades", "2 of Clubs", "3 of Diamonds", "2 of Spades") }
  let(:four_of_a_kind_deck) { Deck.new.add_cards("4 of Hearts", "4 of Diamonds", "4 of Spades", "King of Spades", "4 of Clubs") }
  let(:straight_flush_deck) { Deck.new.add_cards("10 of Diamonds", "Jack of Diamonds", "Ace of Diamonds", "King of Diamonds", "Queen of Diamonds") }

  it "can identify the High Card" do
    HandReader.new(high_card_deck).is_high_card?.should be_true
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
   HandReader.read(straight_flush_deck).type.should == "Straight Flush"
  end
  it "can identify the best hand as Four of a Kind" do
    HandReader.read(four_of_a_kind_deck).type.should == "Four of a Kind"
  end
  it "can identify the best hand as a Full House" do
    HandReader.read(full_house_deck).type.should == "Full House"
  end
  it "can identify the best hand as a Flush" do
    HandReader.read(flush_deck).type.should == "Flush"
  end
  it "can identify the best hand as a Straight" do
    HandReader.read(straight_deck).type.should == "Straight"
  end
  it "can identify the best hand as Three of a Kind" do
    HandReader.read(three_of_a_kind_deck).type.should == "Three of a Kind"
  end
  it "can identify the best hand as Two Pair" do
    HandReader.read(two_pair_deck).type.should == "Two Pair"
  end
  it "can identify the best hand as One Pair" do
    HandReader.read(one_pair_deck).type.should == "One Pair"
  end
  it "can identify the best hand as the High Card" do
    HandReader.read(high_card_deck).type.should == "High Card"
  end

  # it "lets me show debug output" do
  #   p HandReader.new(one_pair_deck).is_one_pair?
  #   p HandReader.new(two_pair_deck).is_two_pair?
  #   p HandReader.new(three_of_a_kind_deck).is_three_of_a_kind?
  #   p HandReader.new(straight_deck).is_straight?
  #   p HandReader.new(flush_deck).is_flush?
  #   p HandReader.new(full_house_deck).is_full_house?
  #   p HandReader.new(four_of_a_kind_deck).is_four_of_a_kind?
  #   p HandReader.new(straight_flush_deck).is_straight_flush?
  # end
end

