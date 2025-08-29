function [hand, currentCard, deck] = addCard(currentCard, deck, hand)
% adds card to hand

if currentCard >= 48 % if the current card is more thant the 48th shuffle the deck again to ensure it doe snot end
    deck = shuffleDeck();
    currentCard = 1;
end

% read in the length of the hand and append new card to it
hand(length(hand)+1) = deck(currentCard);
% update current card
currentCard = currentCard + 1;

end