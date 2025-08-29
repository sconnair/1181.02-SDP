function [singleAce,currentCard, playerHand, realPlayerHand, dealerHand, realDealerHand, showDealer, finalOutput, blkjSzn, empty_sprite, blank_line, empty_card1, empty_card2, backD, backP, dealerLine, playerLine] = initialisation()

set(0, 'DefaultFigureWindowStyle', 'docked');
warning('off', 'images:imshow:magnificationMustBeFitForDockedFigure');

% outputes the rules of the game and intialises some variablesi
blkjSzn = simpleGameEngine('retro_cards.png', 16, 16, 30, [1, 50, 32]);
empty_sprite = 1;
blank_line = ones(empty_sprite, 6);
empty_card1 = 2;
empty_card2 = 4;
backD = [empty_card1, empty_card1, 1, 1, 1, 1] ;
backP = [empty_card1, empty_card1, 1, 1, 1, 1];
dealerLine = [empty_card2, empty_card2, 1, 1, 1, 1];
playerLine = [empty_card2, empty_card2, 1, 1, 1, 1];

% make a figure for the title and allow the user to pick his balance
%drawScene(blkjSzn, grid);
% Center the text on the game screen
%title('BLACKJACK', 'FontSize',15,'Color','r');


% intialize variables
singleAce = false;
currentCard = 1;
playerHand = [];
realPlayerHand = [];
dealerHand = [];
realDealerHand = [];
showDealer = false;
finalOutput = false;
end