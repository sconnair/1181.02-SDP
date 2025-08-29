clc
clear

fprintf('loading...')

%play music
[y,Fs] = audioread('Background_music.mp3');
player = audioplayer(y,Fs);
play(player)

% Dock generated figures
set(0, 'DefaultFigureWindowStyle', 'docked');
% Disable unnecessary warning about image magnification
warning('off', 'images:imshow:magnificationMustBeFitForDockedFigure');

% Initialize the game selection screen
select_screen = simpleGameEngine('game_select.png', 16, 16, 30);

clc

%fun fact #1
fprintf('Educational Fact #1: Money raised from gambling and lotteries has been used to fund many public\n')
fprintf('building projects, including construction of The Great Wall of China.\n')

% Function to draw and display the game select screen
function drawGameSelectScreen(scene)
    Board = [1, 2, 3, 4, 31;  % Placeholder icons
             6, 26, 8, 27, 10;
             11, 12, 13, 14, 15;
             16, 28, 18, 29, 20;
             21, 22, 23, 24, 25];
    drawScene(scene, Board);
    title('Welcome to the Casino!', 'FontSize', 20, 'FontWeight', 'bold');
    xlabel('Click on a game to play (Over Under Seven, BlackJack, Matching, or Connect 4)');
end

% Game selection loop
while true
    % Display game selection screen
    drawGameSelectScreen(select_screen);
    
    % Validate input: ensure the user clicks on a valid icon
    validClick = false;
    while ~validClick
        %get the click on an icon
        [r, c] = getMouseInput(select_screen); 
        % determine if valid icon was selected
        if (r == 2 && c == 2) || (r == 4 && c == 2) || (r == 2 && c == 4) || (r == 4 && c == 4) || (r == 1 && c == 5) 
            validClick = true;
        else
            %print error for invalid click
            fprintf('Invalid click. Try clicking one of the icons.\n'); 
        end
    end
    
    % Handle game selection
    clc
    if r == 2 && c == 2
        % Over Under Seven
        fprintf('Launching Over Under Seven...\n');
        % fun fact #2
        fprintf('Educational Fact #2: The oldest-known dice ever were excavated at "The Burnt City" in present-day Iran\n')
        fprintf('as a portion of a backgammon-like game set that dates back to 5000 B.C.\n')
        OverUnderSeven_function(); % Call your OverUnderSeven function
    elseif r == 4 && c == 2
        % Matching (placeholder)
        fprintf('Launching Matching...\n');
        % fun fact #3
        fprintf('Educational Fact #3: The Merriam-Webster definition for "matching" is "having the same appearance, design, etc."\n')
        matchingFunction(); % Call your Matching function
    elseif r == 2 && c == 4
        % BlackJack (placeholder)
        fprintf('Launching BlackJack...\n');
        %fun fact # 4
        fprintf('Educational Fact #4: Blackjack has the best odds of winning compared to other casino games.\n')
        blackjackF(); % Call your BlackJack function
    elseif r == 4 && c == 4
        % Connect 4 (placeholder)
        fprintf('Launching Connect 4...\n');
        %fun fact #5
        fprintf('Educational Fact #5: There are 4,531,985,219,092 possible board configurations in Connect 4.\n')
        Connect4Function(); % Call your Connect 4 function
    elseif r==1 && c==5
        stop(player) 
        fprintf('Shutting Down...\n')
        close all %close game select window
        pause(0.5)
        break %break out of game select loop
    end
    
    % Return to the game select screen after the selected game ends
    clc
    fprintf('Returning to the game selection screen...\n');
    pause(0.5)
    clc
end

%pause before clearing command window
pause(2)
clc

