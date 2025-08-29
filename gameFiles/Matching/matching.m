clc
clear

% Welcoming and introducing the player to the game.
fprintf('\n Welcome to Our Matlab Memory Game!!')
fprintf('\n Here are some fast facts about Civil Engineering!')
fprintf('\n 1. It is the Oldest Engineering Discipline.')
fprintf('\n 2. Broad Field: It encompasses various sub-disciplines, including structural, environmental, geotechnical, transportation, and water resources engineering')
fprintf('\n 3. Essential for Society: Civil engineers design, construct, and maintain the infrastructure we rely on daily, such as roads, bridges, buildings, water supply systems, and more.')
fprintf('\n 4. Famous Structures: Civil engineers have been responsible for iconic structures like the Eiffel Tower, Hoover Dam, and the Golden Gate Bridge.')
fprintf('\n 5. Sustainable Development: Modern civil engineering emphasizes sustainable development, focusing on creating eco-friendly and resilient infrastructure.')

% Introduce the game engine with the retro card set
MemoryGame = simpleGameEngine('retro_cards.png', 16, 16, 4, [245, 245, 245]);

% Loop to keep playing until the user decides to quit
playAgain = true;  % Flag for restarting the game
while playAgain
    % Game introduction
    % Draw starting scene
    drawScene(MemoryGame, ones(4, 4));
    % Produce intro text
    intro = text(25, 125, ["Match all the cards in as few attempts as you can", ...
        "Only card value matters, so don't worry about suit", ...
        "Click on the scene to begin playing!"]);
    % Wait until user clicks to start game and get rid of intro text
    getMouseInput(MemoryGame);
    intro.Visible = 'off';

    % %%%%%GAME LOOP%%%%%
    % Declaration of what the back of the card looks like. This is done by
    % randomly selecting an index from 3-10
    cardBack = randi(7) + 3;

    % Declaration of the play grid. This array will be manipulated to display
    % various things. It'll start off blank and the elements of it can be
    % replaced with various cards
    displayArray = ones(4, 4) * cardBack;

    % Randomly declare the card values underneath the cardBacks.
    % This is done by creating a random assortment of indexes from 21 - 72.
    numPairs = 8; % Number of unique card pairs
    uniqueCards = randperm(numPairs) + 20; % Generate 8 unique card values
    cardValues = [uniqueCards, uniqueCards]; % Duplicate for pairs
    cardValues = cardValues(randperm(16)); % Shuffle the 16 cards
    cardArray = reshape(cardValues, [4, 4]); % Arrange into a 4x4 grid

    % Declare variable for how many matches the user has made
    numMatches = 0;

    % Loop until every card is removed
    while any(find(displayArray > 1, 1))
        % Display current scene state
        drawScene(MemoryGame, displayArray);
        % Flip a card at mouse position
        displayArray = flipCard(displayArray, cardArray, MemoryGame);
        % Display current scene state
        drawScene(MemoryGame, displayArray);
        % Flip another card
        displayArray = flipCard(displayArray, cardArray, MemoryGame);
        % Display current scene state then wait a second
        drawScene(MemoryGame, displayArray);
        pause(1);
        % Increment number of matches
        numMatches = numMatches + 1;
        % Update array to reflect if the user successfully matched anything
        displayArray = confirmMatches(displayArray, cardBack);
        % Display end result to user before looping again
        drawScene(MemoryGame, displayArray);
    end

    % Game over - all cards matched
    fprintf('\nCongratulations! You matched all the cards in %d attempts!', numMatches);

    % Ask the user if they want to play again
    playAgainInput = input('\nDo you want to play again? (y/n): ', 's');
    if lower(playAgainInput) ~= 'y'
        playAgain = false; % Exit the main loop
        fprintf('\nThanks for playing! Goodbye!\n');
    end
end
%clear figure
clear all