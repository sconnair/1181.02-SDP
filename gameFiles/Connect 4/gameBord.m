function [affbord] = gameBord(move,player,bord)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
good=1;

while good==1
    if move <=7 && move>=1
        if bord(6,move)==1              
            bord(6,move)=player;
            good=2;
        elseif bord(5,move)==1            
            bord(5,move)=player;
             good=2;
        elseif bord(4,move)==1
            bord(4,move)=player;
             good=2;
        elseif bord(3,move)==1
            bord(3,move)=player;
             good=2;
        elseif bord(2,move)==1
            bord(2,move)=player;
             good=2;
        elseif bord(1,move)==1
            bord(1,move)=player;
             good=2;
        else
            fprintf("Not a valid move")
            move=input("\n make you moves");
        end
    else
        fprintf("Not a valid move")
        move=input("\n make you moves");
    end
affbord = bord;
end