function loss(bet)
% Creates a loss screen with a dynamic message based on the user's balance

% Create a larger figure window
fig = figure('Name', 'Blackjack - Loss Screen', ...
    'NumberTitle', 'off', ...
    'MenuBar', 'none', ...
    'ToolBar', 'none');

% Add the "You Lost" message at the top
lostText = uicontrol('Style', 'text', ...
    'String', 'You Lost!', ...
    'FontSize', 50, ... % Larger font size for the message
    'FontWeight', 'bold', ...
    'ForegroundColor', 'red', ...
    'BackgroundColor', get(fig, 'Color'), ...
    'Position', [475, 350, 450, 80]); % [x, y, width, height]

% Determine the dynamic message based on playerBalance
if bet < 1000
    messageText = 'You could have made a Solar-Powered Charger with that Money';
elseif bet < 100000
    messageText = 'You could have made your own drone with that Money';
elseif bet >= 100000
    messageText = 'You could have given a whole community renewable energy with that Money';
else
    messageText = 'Default message'; % Fallback case
end

% Add the dynamic message below the "You Lost!" text
messageDisplay = uicontrol('Style', 'text', ...
    'String', messageText, ...
    'FontSize', 15, ... % Adjusted font size
    'FontWeight', 'normal', ...
    'ForegroundColor', 'black', ...
    'BackgroundColor', get(fig, 'Color'), ...
    'Position', [500, 275, 375, 50]); % [x, y, width, height]

% Add a "Continue" button to close the window
continueButton = uicontrol('Style', 'pushbutton', ...
    'String', 'Continue', ...
    'FontSize', 15, ... % Slightly larger button text
    'Position', [650, 200, 100, 50], ... % Centered button
    'Callback', @(src, event) uiresume(fig)); % Resume execution when clicked

% Pause to display the screen
uiwait(fig);

% Close the figure after the button is clicked
close(fig);
end
