#!/bin/bash

# Define PSQL command for PostgreSQL operations
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate a random number between 1 and 1000
RANDOM_NUMBER=$((1 + $RANDOM % 1000))

# Ask for username
echo "Enter your username:"
read USERNAME

# Check username length
if [ ${#USERNAME} -le 22 ]; then
  # Check if user is in the database
  CHECK_USER_RESULT=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
  
  # If not in the database
  if [[ -z $CHECK_USER_RESULT ]]; then
    # Insert into the database and welcome the user
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    # Get user's stats
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
    # Welcome back with stats
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
else
  # Inform the user if the username exceeds the maximum allowed length
  echo -e "\nYour username exceeds the maximum allowed length."
fi

# Start the game
NUMBER_OF_GUESSES=0

# Define the game function
function GAME() {
  # Initial prompt and handling of future arguments
  if [[ -z $1 ]]; then
    echo "Guess the secret number between 1 and 1000:"
  else
    echo $1
  fi

  read USER_GUESS
  
  # Check if the input is an integer
  if [[ $USER_GUESS =~ ^[0-9]+$ ]]; then
    # If the guess is not correct
    if [ $USER_GUESS -ne $RANDOM_NUMBER ]; then
      if [ $USER_GUESS -lt $RANDOM_NUMBER ]; then
          NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
          GAME "It's higher than that, guess again:"      
      elif [ $USER_GUESS -gt $RANDOM_NUMBER ]; then
        NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
        GAME "It's lower than that, guess again:"
      fi
    else
      # If the number has been guessed correctly
      NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      # If it's the first game
      if [[ -z $GAMES_PLAYED ]]; then
        UPDATING_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = 1 WHERE username = '$USERNAME'")
        UPDATING_BEST_RESULT=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
      else
        # Update the stats
        UPDATING_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = $(($GAMES_PLAYED + 1)) WHERE username = '$USERNAME'")
        # If personal best is beaten
        if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
          UPDATING_BEST_RESULT=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
        fi
      fi
      exit
    fi
  else
    # If the input is not an integer
    GAME "That is not an integer, guess again:"
  fi
}

# Call the game function
GAME
