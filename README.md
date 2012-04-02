# "Poker Hand" Job
> The oldest profession in Casino history.

This was created as part of a group coding session/race between
[tzodyaq](https://github.com/tzodyaq),
[ottiferous](https://github.com/ottiferous) and
[zolrath](https://github.com/zolrath).

For nearly unlimited fun/learning potential, we set out to see how each of us
would code the same problem with one primary goal:

**Create a program that returns the hand one has when given five cards.**

This is our story.

## Usage
If for some bizarre reason you want to use poker hand job you certainly can.

But... why?

## Standard Deck
To get a standard 52 card deck just ask for one politely!

    deck = Deck.please

## Draw from the deck
You can `draw` cards from the deck. Standard draw size is 5 cards, but you can
ask for more.

    5_card_hand = deck.draw
    big_hand = deck.draw(10)
    deal_works_too = deck.deal(5)

## Whats the hand?

    hand = Deck.new.add_cards("Ace of Hearts", "2 of Spades", "3 of Diamonds",
                              "4 of Spades", "5 of Hearts")
    puts HandReader.read(hand)

## Who won?
HandJudge can take any number of hands and return the winner.

    one_pair = Deck.new.add_cards("6 of Hearts", "6 of Spades", "10 of Diamonds",
                                  "King of Spades", "2 of Diamonds")
    two_pair = Deck.new.add_cards("4 of Hearts", "4 of Spades", "10 of Diamonds",
                                  "King of Spades", "10 of Hearts") }
    full_house =  Deck.new.add_cards("King of Hearts", "King of Spades", "2 of Clubs",
                                     "King of Diamonds", "2 of Spades")
    HandJudge.judge(one_pair, full_house, two_pair).winner.should == full_house

## Gross
Yeah. I'll make a prettier API when our coding battle resumes.
