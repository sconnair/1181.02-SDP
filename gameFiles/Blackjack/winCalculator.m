function [playerBalance, playerHand, realPlayerHand, dealerHand, realDealerHand] = winCalculator(realPlayerHand, realDealerHand, playerBalance, bet, blkjSzn, empty_sprite, blank_line, empty_card1, empty_card2, backD, backP, dealerLine, playerLine)
% this function check for current status of player and dealers hand an
% doutputs accordingly the winnings
    playerBalance = playerBalance - bet;
    % calculate winnings and different bet outcomes
    if sum(realPlayerHand) > 21
        loss(playerBalance + bet);
    elseif sum(realDealerHand) > 21
        win();
        playerBalance = playerBalance + 2*bet;
    elseif sum(realPlayerHand) > sum(realDealerHand)
        win();
        playerBalance = playerBalance + 2*bet;
    elseif sum(realPlayerHand) == sum(realDealerHand)
        tie();
        playerBalance = playerBalance + bet;
    else
        loss(bet);
    end
    fprintf('Your current balance is: %0.0f\n', playerBalance);

    % reinitiate som variable for the next round
    playerHand = [];
    realPlayerHand = [];
    dealerHand = [];
    realDealerHand = [];
end

        