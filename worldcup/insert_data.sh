#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

INSERT_TEAM() {
# arg1: Name
NAME=$1
# TRY TO GET TEAM FIRST
TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$NAME'")
# IF NOT FOUND
if [[ -z $TEAM_ID ]]
then
  # ADD TEAM
  echo 
  INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$NAME') RETURNING team_id")
  echo $INSERT_TEAM_RESULT | sed -E 's/^([0-9]+).*/\1/'
else
  echo $TEAM_ID
fi
}

INSERT_GAME() {
  # Arg1: YEAR
  # Arg2: ROUND
  # Arg3: WINNER_ID
  # Arg4: OPPONENT_ID
  # Arg5: WINNER_GOALS
  # Arg6: OPPONENT_GOALS

  # Check if already inserted
  GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID AND opponent_goals=$OPPONENT_GOALS AND winner_goals=$WINNER_GOALS" | sed 's/ *//g') 
  if [[ -z $GAME_ID ]]
  then
    # Insert game
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  else
    echo "Game already inserted"
  fi
}

cat games.csv | while IFS="," read  YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # echo "Year: $YEAR | Round: $ROUND | Winner: $WINNER | Opponent: $OPPONENT | Winner goals: $WINNER_GOALS | Opponent goals: $WINNER_GOALS"
  if [[ ! $WINNER == 'winner' ]]
  then
    
    WINNER_ID=$(INSERT_TEAM "$WINNER")
    OPPONENT_ID=$(INSERT_TEAM "$OPPONENT")

    INSERT_GAME $YEAR "$ROUND" $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS
  fi
done



# Do not change code above this line. Use the PSQL variable above to query your database.
