clc
clear
%dock generated figures
set(0, 'DefaultFigureWindowStyle', 'docked');
%disable unnecessary warning about image magnification
warning('off', 'images:imshow:magnificationMustBeFitForDockedFigure');
%initialize play variable to be used later
play = 'Y';

%use instruction function for instructions
instrFunc

%get initial money
ifund = scene1Func();
%error loop for invalid inputs
while ifund < 0
    fprintf('Invalid input. Must input a positive number\n')
    %shift focus to command window
    commandwindow;
    ifund = input('How much money would you like to start with?: ');
end


%gameplay loop
while(play == 'Y' && ifund>0)  
    % Initialize scene3, wager amount
    scene3 = simpleGameEngine('noice.png',16,16,15);
    % Create board background
        Board = [7,8,9,10;
            11,12,13,14;
            15,16,17,18];
    drawScene(scene3,Board);
    % Add text elements and get input for the wager amount
    title('How much do you wager?', 'FontSize', 20, 'FontWeight', 'bold');
    xlabel('Input the number value and press enter to continue')
    
    %call get valid wager input function
    wager = wagerLoop(ifund);
   
    % Add text elements and get input for the prediction
    title('Will the roll be over, under, or exactly on 7? (O, U, E)', 'FontSize', 20, 'FontWeight', 'bold');
    xlabel('Press any key to continue')
    %shift focus to command window
    commandwindow;
    prediction = input('Will the roll be under, over, or exactly on 7 (U, O, E)?: ', 's');
    prediction = upper(prediction);

    %error loop for invalid inputs
    while prediction ~= 'U' & prediction ~= 'O' & prediction ~= 'E' % single & because double was throwing errors instead of my message when input was a multi digit number
        fprintf('Invalid input. Must input "U", "O", or "E"\n')
        %shift focus to command window
        commandwindow;
        prediction = input('Will the roll be under, over, or exactly on 7 (U, O, E)?: ', 's');
        prediction = upper(prediction);
    end
    close
        
    % Initialize scene5, Winner/Loser status
    scene5 = simpleGameEngine('noice.png',16,16,15);
    % Random roll of 2 dice (1 row by 2 columns) - only allow values up to 6
    roll = randi(6, 1, 2);
    % Create board background
    Board = [7,8,9,10;
        11, roll, 14;
        15,16,17,18];
    drawScene(scene5,Board);
    sumroll = sum(roll);
    
% if-elseif-else structure function for win\lose    
    ifund = win_lose_scrn(prediction, sumroll, ifund, wager);
   
    %Get input to move on
    getKeyboardInput(scene5);
    close

    fprintf('Your remaining funds are: %i\n', ifund)
    
    %if-elseif-else structure for game over
    if ifund == 0
        %call game over screen function
        gameOverScreen()

    elseif ifund ~= 0

        %initialize scene7, Play again or not
        scene7 = simpleGameEngine('noice.png',16,16,15);
        % Create board background
        Board = [7,8,9,10;
            11,20,20,14;
            15,16,17,18];
        drawScene(scene7,Board);
        %add descriptive text elements
        title('Do you want to play again (Y/N)', 'FontSize', 20, 'Fontweight', 'bold');
        xlabel('Quit now? Who gave you such a preposterous idea? This is the one, I feel it.');    

        %shift focus to command window
        commandwindow;
        %ask user if they want to play again
        play = input('Do you want to play again (Y/N)?: ', 's');
        play = upper(play);
        %throw error message for invalid inputs and ask again
        while play ~= 'Y' & play ~= 'N'
            fprintf('Invalid input. Must input "Y" or "N"\n')
            %shift focus to command window
            commandwindow;
            play = input('Do you want to play again (Y/N)?: ', 's');
            play = upper(play);
        end
        close
    end
   
end

%ensure all figures have closed
close all

