#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

# Default err message
ERR_MESSAGE="Failed to schedule your appointment. Retry !"

MAIN_MENU() {
  if [[ ! -z $1 ]]
  then
    echo -e "\n$1"
  fi
# Retrieve available service & show
AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
for X in ${AVAILABLE_SERVICES[@]}
do
  echo $X | while IFS="|" read ID NAME
  do
  echo "$ID) $NAME"
  done
done

ORCHESTRATE
}

# Schedule appointment
ORCHESTRATE() {
  # Read selected service
  read SERVICE_ID_SELECTED
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
  if [[ -z $SERVICE_ID ]]
  then
    # Return to menu
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # Get or create customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    if [[ -z $CUSTOMER_PHONE ]]
    then
      # Return to menu
      MAIN_MENU $ERR_MESSAGE
    fi
    CUSTOMER=$($PSQL "SELECT customer_id, name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER ]]
    then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
      if [[ -z $CUSTOMER_NAME ]]
      then
        # Return to menu
        MAIN_MENU $ERR_MESSAGE
      fi
    CREATE_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      if [[ -z CREATE_CUSTOMER_RESULT ]]
      then
        # Return to menu
        MAIN_MENU $ERR_MESSAGE
      fi
    CUSTOMER=$($PSQL "SELECT customer_id, name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi

    IFS="|" read -r -a CUSTOMER_INFO <<< "$CUSTOMER"

    SCHEDULE_APPOINTMENT ${CUSTOMER_INFO[0]} "${CUSTOMER_INFO[1]}" $SERVICE_ID
  fi
}

SCHEDULE_APPOINTMENT() {
  # Arg1 : CUSTOMER_ID
  # Arg2 : CUSTOMER_NAME
  # Arg3 : SERVICE_ID

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $3")

  echo -e "\nWhat time would you like your $SERVICE_NAME, $2?"
  read SERVICE_TIME
  if [[ -z $SERVICE_TIME ]]
  then
    # Return to menu
    MAIN_MENU $ERR_MESSAGE
  fi
  SCHEDULE_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($1, $3, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $2."
}


echo -e "\n~~~~~ MY SALON ~~~~~"

MAIN_MENU "Welcome to My Salon, how can I help you?\n"
