function [WIN] = horzTest(bord,player)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
win=1;
for i=1:6
    for j=1:4
     
        if (bord(i,j)==player) && (bord(i,j+1)==player)&& ((bord(i,j+2)==player) && (bord(i,j+3)==player))
            win=player;
            break
        end
    end
end
WIN=win;
end