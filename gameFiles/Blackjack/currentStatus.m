function [] = currentStatus(playerHand, dealerHand, realPlayerHand, realDealerHand, showDealer, finalOutput, playerBalance, blkjSzn, empty_sprite, blank_line, empty_card1, empty_card2, backD, backP, dealerLine, playerLine,bet)
% outputs the dealers and the players hand
    
    if finalOutput == false % choose for final or not output
        if showDealer == false % choose for final dealer output in full
            playerLen = length(playerHand);
                dealerLine = [empty_card2, dealerHand(2), 1, 1, 1, 1];

                if playerLen == 6
                    playerLine = [playerHand(1), playerHand(2), playerHand(3), playerHand(4), playerHand(5), playerHand(6)];
                    backP = [empty_card1, empty_card1, empty_card1, empty_card1, empty_card1, empty_card1];
                elseif playerLen == 5
                    playerLine = [playerHand(1), playerHand(2), playerHand(3), playerHand(4), playerHand(5), 1];
                    backP = [empty_card1, empty_card1, empty_card1, empty_card1, empty_card1, 1];
                elseif playerLen == 4
                    playerLine = [playerHand(1), playerHand(2), playerHand(3), playerHand(4), 1, 1];
                    backP = [empty_card1, empty_card1, empty_card1, empty_card1, 1, 1];
                elseif playerLen == 3
                    playerLine = [playerHand(1), playerHand(2), playerHand(3), 1, 1, 1];
                    backP = [empty_card1, empty_card1, empty_card1, 1, 1, 1];
                elseif playerLen == 2
                    playerLine = [playerHand(1), playerHand(2), 1, 1, 1, 1];
                    backP = [empty_card1, empty_card1, 1, 1, 1, 1];
                end
                drawScene(blkjSzn, [backD; backP], [dealerLine; playerLine])
                title('Left Click to Hit / Right Click to Stand', 'FontSize', 20, 'Color', 'r');
                fprintf('You have %0.0f\n\n', sum(realPlayerHand))
            

        else
            playerLen = length(playerHand);
            dealerLen = length(dealerHand);

                if dealerLen == 6
                    dealerLine = [dealerHand(1), dealerHand(2), dealerHand(3), dealerHand(4), dealerHand(5), dealerHand(6)];
                    backD = [empty_card1, empty_card1, empty_card1, empty_card1, empty_card1, empty_card1];
                elseif dealerLen == 5
                    dealerLine = [dealerHand(1), dealerHand(2), dealerHand(3), dealerHand(4), dealerHand(5), 1];
                    backD = [empty_card1, empty_card1, empty_card1, empty_card1, empty_card1, 1];
                elseif dealerLen == 4
                    dealerLine = [dealerHand(1), dealerHand(2), dealerHand(3), dealerHand(4), 1, 1];
                    backD = [empty_card1, empty_card1, empty_card1, empty_card1, 1, 1];
                elseif dealerLen == 3
                    dealerLine = [dealerHand(1), dealerHand(2), dealerHand(3), 1, 1, 1];
                    backD = [empty_card1, empty_card1, empty_card1, 1, 1, 1];
                elseif dealerLen == 2
                    dealerLine = [dealerHand(1), dealerHand(2), 1, 1, 1, 1];
                    backD = [empty_card1, empty_card1, 1, 1, 1, 1];
                end


                if playerLen == 6
                    playerLine = [playerHand(1), playerHand(2), playerHand(3), playerHand(4), playerHand(5), playerHand(6)];
                    backP = [empty_card1, empty_card1, empty_card1, empty_card1, empty_card1, empty_card1];
                elseif playerLen == 5
                    playerLine = [playerHand(1), playerHand(2), playerHand(3), playerHand(4), playerHand(5), 1];
                    backP = [empty_card1, empty_card1, empty_card1, empty_card1, empty_card1, 1];
                elseif playerLen == 4
                    playerLine = [playerHand(1), playerHand(2), playerHand(3), playerHand(4), 1, 1];
                    backP = [empty_card1, empty_card1, empty_card1, empty_card1, 1, 1];
                elseif playerLen == 3
                    playerLine = [playerHand(1), playerHand(2), playerHand(3), 1, 1, 1];
                    backP = [empty_card1, empty_card1, empty_card1, 1, 1, 1];
                elseif playerLen == 2
                    playerLine = [playerHand(1), playerHand(2), 1, 1, 1, 1];
                    backP = [empty_card1, empty_card1, 1, 1, 1, 1];
                end
                drawScene(blkjSzn, [backD; backP], [dealerLine; playerLine])
                title('Left Click to Hit / Right Click to Stand', 'FontSize', 15, 'Color', 'r');
                fprintf('Dealer has %0.0f\n', sum(realDealerHand))
                fprintf('You have %0.0f\n\n', sum(realPlayerHand))
        end

    else % final outputs and graph maker
        if playerBalance == 0
            fprintf('You went from $%d to $0.\nMake better decisions next time\n\n', bet);
        end
    end
end

