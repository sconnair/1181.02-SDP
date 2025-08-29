function [WIN] = verTest(bord,player)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
win=1;
for i=1:3
    for j=1:7
     
        if (bord(i,j)==player) && (bord(i+1,j)==player)&& ((bord(i+2,j)==player) && (bord(i+3,j)==player))
            win=player;
            break
        end
    end
    if win==player
        break
    end
end
WIN=win;
end