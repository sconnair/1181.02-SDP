clear;
clc;

playAgain = true;
while playAgain

playerBalance = openingScreen();
[singleAce,currentCard, playerHand, realPlayerHand, dealerHand, realDealerHand, showDealer, finalOutput, blkjSzn, empty_sprite, blank_line, empty_card1, empty_card2, backD, backP, dealerLine, playerLine] = initialisation(); %intitialize variables



while playerBalance > 0 % keep repeating game until player does not have any money left

    % first turn functions
    [deck] = randperm(72 - 21 + 1) + 21 - 1; % build deck
    [bet] = playerBalance; % get player bet

    [playerHand, currentCard, deck] = addCard(currentCard, deck, playerHand);
    [playerHand, currentCard, deck] = addCard(currentCard, deck, playerHand); % add two cards to player hand
    [realPlayerHand] = cardFinder(playerHand); % convert reference cards to actual cards

    [dealerHand, currentCard, deck] = addCard(currentCard, deck, dealerHand);
    [dealerHand, currentCard, deck] = addCard(currentCard, deck, dealerHand); % add two cards to dealer hand
    [realDealerHand] = cardFinder(dealerHand); % convert reference cards to actual cards
    

    [realDealerHand] = aceConversion(realDealerHand, singleAce); % conver aces to 11 when needed
    [realPlayerHand] = aceConversion(realPlayerHand, singleAce); % conver aces to 11 when needed

    currentStatus(playerHand, dealerHand,realPlayerHand, realDealerHand, showDealer, finalOutput, playerBalance, blkjSzn, empty_sprite, blank_line, empty_card1, empty_card2, backD, backP, dealerLine, playerLine, bet); % output current status

    % player choice function
    [choice] = playerChoice(blkjSzn);

    while isequal(choice, 'hit') % while loop checks for player move

        [playerHand, currentCard, deck] = addCard(currentCard, deck, playerHand); % add 1 more card to the player hand
        [realPlayerHand] = cardFinder(playerHand); % convert cards
        [realPlayerHand] = aceConversion(realPlayerHand, singleAce); % convert aces when needed
        currentStatus(playerHand, dealerHand, realPlayerHand, realDealerHand, showDealer, finalOutput, playerBalance, blkjSzn, empty_sprite, blank_line, empty_card1, empty_card2, backD,backP, dealerLine, playerLine, bet)

        if sum(realPlayerHand) > 21 % player busted
            break
        end

        [choice] = playerChoice(blkjSzn);
    end

    % dealer functions
    if sum(realPlayerHand) <= 21
        
            % dealer choice options
            while sum(realDealerHand) <= 16 % dealer hits while his hand is less or equal than 16
                [dealerHand, currentCard, deck] = addCard(currentCard, deck, dealerHand); % dealer hits function
                [realDealerHand] = cardFinder(dealerHand); % convert cards
            end

            [realDealerHand] = aceConversion(realDealerHand, singleAce); %  convert Ace
            showDealer = true; % change boolean ot show dealer card
            currentStatus(playerHand, dealerHand, realPlayerHand, realDealerHand, showDealer, finalOutput, playerBalance, blkjSzn, empty_sprite, blank_line, empty_card1, empty_card2, backD, backP, dealerLine, playerLine, bet); % output current status
            showDealer = false; % change boolean again for next round
    end
    
    % player win status, bet calculations
    [playerBalance, playerHand, realPlayerHand, dealerHand, realDealerHand] = winCalculator(realPlayerHand, realDealerHand, playerBalance, bet);

end

% final outputs
finalOutput = true; % final status
currentStatus(playerHand, dealerHand, realPlayerHand, realDealerHand, showDealer, finalOutput, playerBalance, blkjSzn, empty_sprite, blank_line, empty_card1, empty_card2, backD, backP, dealerLine, playerLine,bet)

playAgain = again(playAgain);
end

