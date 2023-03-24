#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
#Main Menu Function

#APPOINTMENT_MENU FUNCTION
APPOINTMENT_MENU() {
  echo -e "Please Choose one of our services"
  SERVICES=$($PSQL "SELECT * FROM services order by SERVICE_ID") 
  echo "$SERVICES" | while read ID BAR NAME
  do
   echo -e "\n$ID) $NAME"
  done
echo -e "\nPlease make a selection"
#ask which service
read SERVICE_ID_SELECTED
ID_RESULT=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED")
 if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
    #send to main_menu
    APPOINTMENT_MENU "That is not a valid service number."
    elif [[ -z $ID_RESULT ]]
      then APPOINTMENT_MENU "That is not a valid service number."
      #get customer info
    else 
    echo -e "\n What is your phone number"
      read CUSTOMER_PHONE
      PHONE_CHECK=$($PSQL "select phone from customers where phone='$CUSTOMER_PHONE'")
      if [[ -z $PHONE_CHECK ]]
      then
      echo -e "What's your name?"
      read CUSTOMER_NAME
      $($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      fi
      
      #define customer info and make appointment
      CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
      echo -e "\nWhat time do you want your appointment?"
      read SERVICE_TIME
      CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
      SERVICE_NAME=$($PSQL "select name from services where service_id= $SERVICE_ID_SELECTED")
      APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id, service_id, time) values('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
      echo "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

    fi
  
    exit
}
APPOINTMENT_MENU
exit
