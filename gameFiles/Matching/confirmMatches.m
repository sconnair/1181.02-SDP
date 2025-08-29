function [testedArray] = confirmMatches(targetArray, cardBack)
%%%The purpose of this function is to test if the two selected cards are the
%%same value. If they aren't they the cards flip back over otherwise, they
%disappear.
%Convert all face up cards to hearts
convertedArray = convertCardsToValue(targetArray);
%Get size of array
[rows, cols]=size(convertedArray);
amount = rows * cols;
%Loop through each index of the Arrau
for i = 1: amount
 %Only test a card if it's face up
 if(convertedArray(i)>20)
 %Loop through every card after the card being tested
 for j = i+1:amount
 %%If the loop finds a card of the same value as the
%testee then make both cards blank
if (convertedArray(i) == convertedArray(j))
 convertedArray(i) = 1;
 convertedArray(j) = 1;
 targetArray(i) = 1;
 targetArray(j) = 1;
 end
 end
 end
end
%Loop through targetArray
for i = 1:amount
 %If card is still face up then flip it back over
 if(targetArray(i) >= 21)
 targetArray(i) = cardBack;
 end
end
%Return the testedArray
testedArray= targetArray;
end
