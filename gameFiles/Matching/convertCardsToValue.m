function convertedArray = convertCardsToValue(targetArray)
%Change the value of every face up card to it's hearts equivalent
%Get size of array
[rows,cols]=size(targetArray);
%Loop through every index
for i=1:rows
 for j=1:cols
 %%If a number is greater than 33 subtract 13 from it until it's
 %below 33. This converts all the cards into hearts
 while(targetArray(i,j)>33)
 targetArray(i,j) = targetArray(i,j) - 13;
 end
 end
end
%Return the new array
convertedArray = targetArray;
end
