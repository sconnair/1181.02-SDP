function [flippedArray] = flipCard(targetArray, cardArray,gameEngine)
%Flip a value in a array from the cardback value to it's true value
%Get position of mouse input until it selects a card which is a card back
[row,col] = getMouseInput(gameEngine);
while targetArray(row,col) == 1 || targetArray(row,col) > 20
[row,col] = getMouseInput(gameEngine);
end
%Change card value to it's true value
targetArray(row,col)=cardArray(row,col);
%Return changed array
flippedArray = targetArray;
end

