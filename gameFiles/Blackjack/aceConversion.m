function [hand] = aceConversion(hand, singleAce)
% converts ace to 11 if necessary

    for i = 1 : length(hand)
            if hand(i) == 1 && singleAce == false % converts only one ace if there are more than two in a hand
                hand(i) = 11;
                singleAce = true;
            end
            if sum(hand) > 21 && hand(i) == 11
                hand(i) = 1;
            end
    end
end