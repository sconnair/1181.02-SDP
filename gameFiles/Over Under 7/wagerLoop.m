function wager = wagerLoop(ifund)
    %loop to stop betting more money than you have
    allowed = 0;
    while allowed == 0
        %shift focus to command window
        commandwindow;
        wager = input('How much do you wager?: ');

        %error loop for invalid inputs
        while wager < 0
            fprintf('Invalid input. Must input a positive number\n')
            %shift focus to command window
            commandwindow;
            wager = input('How much do you wager?: ');
        end
        
        if wager > ifund
            fprintf('Insufficient funds, pick a new wager\n')
            allowed = 0;
        else
            allowed = 1;
        end 
    end
end