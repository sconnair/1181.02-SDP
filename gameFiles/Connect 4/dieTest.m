function [WIN] = dieTest(bord,player)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
win=1;
for i=3:6
    for j=1:4
     
        if (bord(i,j)==player) && (bord(i-1,j+1)==player)&& ((bord(i-2,j+2)==player) && (bord(i-3,j+3)==player))
            win=player;
            break
        end
    end
    if win==player
        break
    end
end
for i=1:3
    for j=1:4
     
        if (bord(i,j)==player) && (bord(i+1,j+1)==player)&& ((bord(i+2,j+2)==player) && (bord(i+3,j+3)==player))
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