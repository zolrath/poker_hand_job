require_relative '../../lib/poker_hand_job/hand_judge'
require_relative '../../lib/poker_hand_job/hand_reader'

describe "HandJudge" do
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

  let(:high_card) { HandReader.read(high_card_deck) }
  let(:pair_of_threes) { HandReader.read(one_pair_deck_low) }
  let(:pair_of_sixes) { HandReader.read(one_pair_deck) }
  let(:two_pair) { HandReader.read(two_pair_deck) }
  let(:three_of_a_kind) { HandReader.read(three_of_a_kind_deck) }
  let(:straight) { HandReader.read(straight_deck) }
  let(:flush) { HandReader.read(flush_deck) }
  let(:full_house_low) { HandReader.read(full_house_deck_low) }
  let(:full_house) { HandReader.read(full_house_deck) }
  let(:four_of_a_kind) { HandReader.read(four_of_a_kind_deck) }
  let(:straight_flush) { HandReader.read(straight_flush_deck) }

  it "knows which hands are better than other hands" do
    HandJudge.judge(flush, four_of_a_kind).winner.should == four_of_a_kind
  end
  it "knows a pair of sixes are better than a pair of threes" do
    HandJudge.judge(pair_of_sixes, pair_of_threes).winner.should == pair_of_sixes
  end
  it "can judge more than two hands" do
    HandJudge.judge(pair_of_sixes, flush, four_of_a_kind, pair_of_threes, straight_flush).winner.should == straight_flush
  end
  it "knows which full house is best" do
    HandJudge.judge(full_house_low, full_house, three_of_a_kind).winner.should == full_house
  end
  it "can output the winner as a string" do
    HandJudge.judge(full_house_low, full_house, high_card).to_s.should include "The winning hand was a Full House!"
  end
  it "can compare hands with boolean operators" do
    (four_of_a_kind > straight).should be_true
  end
end
