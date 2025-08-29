function instrFunc()

%prints set of instructions for the user
fprintf('\n*** Welcome to Over/Under Seven! ***\n');
fprintf('Here are the rules:\n');
fprintf('1. You start with an initial amount of money that you choose.\n');
fprintf('2. In each round, you can wager an amount up to your current funds.\n');
fprintf('3. Predict whether the sum of two dice rolls will be:\n');
fprintf('   - "U" for Under 7\n');
fprintf('   - "O" for Over 7\n');
fprintf('   - "E" for Exactly 7\n');
fprintf('4. Payouts:\n');
fprintf('   - Under or Over 7: Win = wager amount added; Lose = wager amount deducted.\n');
fprintf('   - Exactly 7: Win = 4 times your wager!\n');
fprintf('5. The game ends when you run out of money or choose to quit.\n');
fprintf('\nGood luck!\n\n');

end