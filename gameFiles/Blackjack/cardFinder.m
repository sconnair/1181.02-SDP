function [realHand] = cardFinder(hand)
    % Converts card indices to face values and suits for a deck of cards.
    % hand: Array of card indices (21 to 72)
    % realHand: Numeric values (1–10) for blackjack
    % suit: Cell array of suits ('Hearts', 'Diamonds', 'Clubs', 'Spades')

    n = length(hand);
    realHand = zeros(1, n); % Initialize hand values

    for i = 1:n
        card = hand(i);

        if card >= 21 && card <= 30
            realHand(i) = card - 20;
        elseif card >= 31 && card <= 33
            realHand(i) = 10;
        elseif card >= 34 && card <= 43
            realHand(i) = card - 33;
        elseif card >= 44 && card <= 46
            realHand(i) = 10;
        elseif card >= 47 && card <= 56
            realHand(i) = card - 46;
        elseif card >= 57 && card <= 59
            realHand(i) = 10;
            elseif card >= 60 && card <= 69
            realHand(i) = card - 59;
        elseif card >= 70 && card <= 72
            realHand(i) = 10;
        end
    end
end
