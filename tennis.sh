#!/bin/bash
# Reut Lev 207385741
# Initialize game variables
player_1_score=50
player_2_score=50
ball_pos=0
player_1_guess=0
player_2_guess=0

# initialize board
board=(1 2 3 4 5)

# function to print board
print_board() {
echo " player 1: ${player_1_score} 		 player 2:${player_2_score}"
  echo "-----------------------------------"
  echo "  |       |       #       |       |  "
  echo "  |       |       #       |       |  "
  case ${ball_pos} in
    3)
      echo "  |       |       #       |       | O"
      ;;
    2)
      echo "  |       |       #       |   O   |  "
      ;;
    1)
      echo "  |       |       #   O   |       |  "
      ;;
    0)
      echo "  |       |       O       |       |  "
      ;;
    -1)
      echo "  |       |   O   #       |       |  "
      ;;
    -2)
      echo "  |   O   |       #       |       |  "
      ;;
    -3)
      echo " O|       |       #       |       |  "
      ;;	
  esac
  echo "  |       |       #       |       |  "
  echo "  |       |       #       |       |  "
  echo "-----------------------------------"
  if [ "$player_1_guess" != 0 ] && [ "$player_2_guess" != 0 ]; then
  echo -e "       Player 1 played: ${player_1_guess}\n       Player 2 played: ${player_2_guess}\n\n"
  fi
}

# function to update ball position
update_ball_pos() {
  if [ ${ball_pos} -eq 3 ] && [ ${player_1_score} -gt 0 ]; then
    ball_pos=-3
  elif [ ${ball_pos} -eq -3 ] && [ ${player_2_score} -gt 0 ]; then
    ball_pos=3
  elif [ ${ball_pos} -gt 0 ] && [ ${player_2_score} -gt 0 ]; then
    ball_pos=$((${ball_pos}-1))
  elif [ ${ball_pos} -lt 0 ] && [ ${player_1_score} -gt 0 ]; then
    ball_pos=$((${ball_pos}+1))
  fi
}

play_turn() {
  # Print the current board and player scores
  print_board

  #echo "Player 1: $player_1_score"
  #echo "Player 2: $player_2_score"
  #echo "ball position: $ball_pos"
  
	  # Ask for player guesses and validate them
	while true; do
	  read -s -p "PLAYER 1 PICK A NUMBER: " player_1_guess
	  echo
	  if ! [[ "$player_1_guess" =~ ^[0-9]+$ ]] || ((player_1_guess > player_1_score)); then
		echo "NOT A VALID MOVE !"
	  else
		break
	  fi
	done

	while true; do
	  read -s -p "PLAYER 2 PICK A NUMBER: " player_2_guess
	  echo
	  if ! [[ "$player_2_guess" =~ ^[0-9]+$ ]] || ((player_2_guess > player_2_score)); then
		echo "NOT A VALID MOVE !"
	  else
		break
	  fi
	done

  
  # Subtract player guesses from player scores
  player_1_score=$((player_1_score - player_1_guess))
  player_2_score=$((player_2_score - player_2_guess))
  
  # Update the ball position
  #update_ball_pos
  
  # Determine the winner of the turn
  if ((player_1_guess < player_2_guess)); then
    # Player 1 wins the turn
    if ((ball_pos < 0)); then
      ball_pos=$((ball_pos - 1))
    else
      ball_pos=-1
    fi
  elif ((player_2_guess < player_1_guess)); then
    # Player 2 wins the turn
    if ((ball_pos > 0)); then
      ball_pos=$((ball_pos + 1))
    else
      ball_pos=1
    fi
  else
    # Tie, ball stays in current position
    echo ""
  fi
  
  
  # Check for end of game conditions
  if ((player_1_score == 0 && player_2_score == 0)); then
    if ((ball_pos > 0)); then
      print_board
      echo "PLAYER 1 WINS !"
    elif ((ball_pos < 0)); then
      print_board
      echo "PLAYER 2 WINS !"
    else
      print_board
      echo "IT'S A DRAW !!"
    fi
    exit 0
  elif ((player_1_score == 0)); then
    print_board
    echo "PLAYER 1 WINS !"
    exit 0
  elif ((player_2_score == 0)); then
    print_board
    echo "PLAYER 2 WINS !"
    exit 0
  elif ((ball_pos == 3)); then
    print_board
    echo "PLAYER 2 WINS !"
    exit 0
  elif ((ball_pos == -3)); then
    print_board
    echo "PLAYER 1 WINS !"
    exit 0
  fi
}

# Main game loop
while true; do
	play_turn
done