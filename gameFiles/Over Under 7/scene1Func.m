function ifund = scene1Func()

    % Initialize scene1, intro
    scene1 = simpleGameEngine('noice.png',16,16,15);
    % Create board background
        Board = [7,8,9,10;
            11,12,13,14;
            15,16,17,18];
    drawScene(scene1,Board);
    % Add text elements
    title('Over/Under Seven', 'FontSize', 20, 'FontWeight', 'bold');
    xlabel('Press any key to continue');
    %Get input to move on
    getKeyboardInput(scene1);
    
    % Add text elements and get input for starting money
    title('How much money would you like to start with?', 'FontSize', 20, 'FontWeight', 'bold');
    xlabel('Input the number value and press enter to continue')
    %shift focus to command window
    commandwindow;
    ifund = input('How much money would you like to start with?: '); 
end