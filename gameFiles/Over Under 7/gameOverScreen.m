function gameOverScreen()
        % Initialize scene6, Game Over Screen
        scene6 = simpleGameEngine('noice.png',16,16,15);
        % Create board background
        Board = [7,8,9,10;
            11,19,19,14;
            15,16,17,18];
        drawScene(scene6,Board);
        %add descriptive text elements
        title('Womp Womp ** GAME OVER ** Womp Womp', 'FontSize', 20, 'FontWeight', 'bold');
        xlabel('See kids? gambling is bad. Now go do the hokey pokey and turn yourself around.');  
        %Get input to move on
        pause(5)
        close;
end