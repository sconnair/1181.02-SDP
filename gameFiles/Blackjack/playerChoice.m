function [choice] = playerChoice(blkjSzn)
% this function prompts the user for a choice and decides wether it is
% valid or not

    [r, c, b] = getMouseInput(blkjSzn);
    
    if b == 1
        choice = 'hit';
    else
        choice = 'stand';
    end
end