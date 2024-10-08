# Tennis Game 

## Overview
This project is a simple text-based tennis game developed using Bash scripting. The game simulates a tennis match where two players compete by guessing numbers, and the ball moves back and forth across the court based on their guesses. The game ends when one player wins by either moving the ball off the opponent's side of the court or when the opponent runs out of score.

## Game Mechanics
- Each player starts with a score of 50.
- Players take turns guessing a number. The player's guess is subtracted from their score.
- The ball moves based on the players' guesses:
  - If **Player 1** guesses lower than **Player 2**, the ball moves towards Player 2.
  - If **Player 2** guesses lower, the ball moves towards Player 1.
  - If both players guess the same number, the ball stays in its current position.
- The ball can be positioned anywhere between -3 to 3, where:
  - `-3` means **Player 1** wins.
  - `3` means **Player 2** wins.
- The game ends when:
  - A player moves the ball off the opponent's side of the court.
  - One player's score reaches zero.

## How to Play
1. Run the script in a bash terminal:
   ```bash
   ./tennis.sh
   ```
2. Follow the prompts to enter guesses for each player. Guesses must be whole numbers and cannot exceed the player's current score.
3. The game will display the current board after each turn, showing the positions of the ball and the remaining scores for both players.
4. The game continues until a player wins or a draw is declared.

## Example Gameplay
- Player 1 and Player 2 alternate turns.
- Each player secretly enters their guess when prompted.
- The board is updated after every turn to show the new ball position and player scores.

  ![image](https://github.com/user-attachments/assets/b72ea7b6-b5fe-4ff1-86cb-6d0daff5ff92)


## Winning Conditions
- **Player 1 wins**: If the ball reaches position `-3` or **Player 2** runs out of score.
- **Player 2 wins**: If the ball reaches position `3` or **Player 1** runs out of score.
- **Draw**: If both players' scores reach zero with the ball still in the middle.

