#! /bin/bash

# Declare PSQL var
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Ask username
echo "Enter your username:"
read USER_NAME_INPUT

# Get or creat user
CONFIG_USER() {
  IFS="|" read -r -a USER <<< "$USER_RESULT"
  USER_ID=${USER[0]}
  USER_NAME=${USER[1]}
}

IS_NEW_USER=1

USER_RESULT=$($PSQL "SELECT user_id, username FROM users WHERE username='$USER_NAME_INPUT'")
if [[ -z $USER_RESULT ]]
then
  USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USER_NAME_INPUT') RETURNING user_id, username")
  IS_NEW_USER=0
  CONFIG_USER
else
  CONFIG_USER
fi

# Get user's game session
GAME_SESSION=$($PSQL "SELECT MIN(number_of_guesses) AS best_game, COUNT(*) AS games_played FROM game_sessions WHERE user_id=$USER_ID")
IFS="|" read -r -a GAME_SESSION <<< "$GAME_SESSION"
GAMES_PLAYED=${GAME_SESSION[1]}
BEST_GAME=${GAME_SESSION[0]}

# Show welcome message
if [[ $GAMES_PLAYED -lt 1 || $IS_NEW_USER == 0 ]]
then
  echo -e "Welcome, $USER_NAME! It looks like this is your first time here."
else
  echo -e "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start new game session
ATTEMPTS=0

(( MAGIC_NUMER =$RANDOM % 1000 + 1 ))

READ_USER_MAGIC_NUMBER() {
  read USER_MAGIC_NUMBER
  ATTEMPTS=$(( ATTEMPTS + 1 ))
  if [[ ! $USER_MAGIC_NUMBER =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:"
    READ_USER_MAGIC_NUMBER
  else
    CHECK_USER_MAGIC_NUMBER $USER_MAGIC_NUMBER $MAGIC_NUMER
  fi
}

CHECK_USER_MAGIC_NUMBER() {
  # ARG1: USER_MAGIC_NUMBER
  # ARG2: MAGIC_NUMER
  if [[ $1 -gt $2 ]]
  then
    echo -e "It's lower than that, guess again:"
    READ_USER_MAGIC_NUMBER
  elif [[ $1 -lt $2 ]]
  then
    echo -e "It's higher than that, guess again:"
    READ_USER_MAGIC_NUMBER
  else
    echo "You guessed it in $ATTEMPTS tries. The secret number was $2. Nice job!"
    SAVE_SESSION_RESULT=$($PSQL "INSERT INTO game_sessions(user_id, number_of_guesses) VALUES($USER_ID, $ATTEMPTS)")
  fi
}

echo "Guess the secret number between 1 and 1000:"
READ_USER_MAGIC_NUMBER
