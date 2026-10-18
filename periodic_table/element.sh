if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  ARG=$1
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
  # SYMBOL NAME TYPE ATOMIC_NUMBER ATOMIC_MASS MELTING_PONT_CELSIUS BOILING_POINT_CELSIUS 
  # The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_PONT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius.
  if [[ $ARG =~ ^[0-9]+$ ]]
  then
    SEARCH_RESULT=$($PSQL "SELECT symbol, name, type, atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ARG LIMIT 1")
  else
    SEARCH_RESULT=$($PSQL "SELECT symbol, name, type, atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$ARG' OR name='$ARG' LIMIT 1")
  fi
  
  if [[ -z $SEARCH_RESULT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$SEARCH_RESULT" | while IFS="|" read SYMBOL NAME TYPE ATOMIC_NUMBER ATOMIC_MASS MELTING_PONT_CELSIUS BOILING_POINT_CELSIUS 
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_PONT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
fi