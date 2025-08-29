function Connect4Function()

% Initialize scene
my_scene = simpleGameEngine('ConnectFour (1).png',86,101);

set(0,'DefaultFigureWindowStyle','docked');
warning('off','images:magnificationMustBeFitForDockedFigure');

% Set up variables to name the various sprites
empty_sprite = 1;
red_sprite = 2;
black_sprite = 3;
conue="n";
%this will make a bord that is easyer to work with
bord=[1:7;8:14;15:21;22:28;29:35;36:42];
bord(:)=1;
%these will help with the loop
noWiner=1;
i=1;

% Display empty board   
board_display = empty_sprite * ones(6,7);
drawScene(my_scene,board_display)
%this should play the game
fprintf("How to play connect four")
fprintf("\n Two players are required")
fprintf("\n You take turns choosing the column that you would like to place your peace in (1-7)")
fprintf("\n The piece will appear in the bottom row in less that row is occupied it will then keep looking ")
fprintf("\n for the first unoccupied row and occupy that")
fprintf("\n When all rows are occupied you cant place a piece there")
fprintf("\n The goal of the game is to place for pieces either horizontally")
fprintf("\n or vertically or diagonally without being blocked by your opponent")
fprintf("\n \n \n The fastest plan to ever fly was the X15 at Mach 6.7")
fprintf("\n When metals heat up they expand this is important ")
fprintf("\n to acknowledge when making things that will experience extreme temperature fluctuations")
fprintf("\n When designing things it is important to remember what you are trying to make ")
fprintf("\n and not how cool it is to do something.\n")
while noWiner==1
    %this takes key bord imputs and makes moves
    
    move=input("make you moves");
    %this swiches the players
    if rem(i,2)==0
        player=red_sprite;
    else
        player=black_sprite;
    end
    %this is how to interact with the bord
   bord= gameBord(move,player,bord);
    %this desplays the bord
   board_display=bord;
   drawScene(my_scene,board_display)
   %bord
   %this says who wins
   noWiner= Win(bord,player);
   if noWiner==2
       fprintf("Player 1 wins!!!")
       conue=input("\n Do you want play agen (Y/N): ","s");
   elseif noWiner==3
       fprintf("Player 2 wins!!!")
       conue=input("\n Do you want play agen (Y/N): ","s");
   end
   if conue=="y"||conue=="Y"
       noWiner=1;
       i=0;
       bord=[1:7;8:14;15:21;22:28;29:35;36:42];
       bord(:)=1;
       conue="n";
   end
   i=i+1;
end

clc
close all