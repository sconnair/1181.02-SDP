function ifund = win_lose_scrn(prediction, sumroll, ifund, wager)
    % Function to evaluate game outcome based on prediction and dice roll
    % Inputs:
    %   prediction - Player's prediction ('U', 'O', 'E')
    %   sumroll    - Sum of the dice rolls
    %   ifund      - Current funds of the player
    %   wager      - Player's wager
    %
    % Output:
    %   ifund      - Updated funds after win/lose

    % Check prediction and update funds accordingly
    if prediction == 'U' && sumroll < 7
        ifund = ifund + wager;
        title('You win!', 'FontSize', 20, 'FontWeight', 'bold');
        xlabel('Click to continue');
    elseif prediction == 'U' && sumroll >= 7
        ifund = ifund - wager;
        title('You lose :(', 'FontSize', 20, 'FontWeight', 'bold');
        xlabel('Press any key to continue');
    elseif prediction == 'O' && sumroll > 7
        ifund = ifund + wager;
        title('You win!', 'FontSize', 20, 'FontWeight', 'bold');
        xlabel('Press any key to continue');
    elseif prediction == 'O' && sumroll <= 7
        ifund = ifund - wager;
        title('You lose :(', 'FontSize', 20, 'FontWeight', 'bold');
        xlabel('Press any key to continue');
    elseif prediction == 'E' && sumroll == 7
        ifund = ifund + 4 * wager;
        title('You win quadruple!', 'FontSize', 20, 'FontWeight', 'bold');
        xlabel('Press any key to continue');
    elseif prediction == 'E' && sumroll ~= 7
        ifund = ifund - wager;
        title('You lose :(', 'FontSize', 20, 'FontWeight', 'bold');
        xlabel('Press any key to continue');
    end
end