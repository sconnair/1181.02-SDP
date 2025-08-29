function [Winner] = Win(bord,player)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
Winner=horzTest(bord,player);
if Winner==1
    Winner=verTest(bord,player);
end
if Winner==1
    Winner=dieTest(bord,player);
end
