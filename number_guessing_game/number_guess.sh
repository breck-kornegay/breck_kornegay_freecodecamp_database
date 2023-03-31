#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
GAME_FUNCTION() {
  WINNING_NUMBER=$[RANDOM%1000+1]
  USERNAME_RESULT=$($PSQL "select user_id from users where username = '$USERNAME'")
  echo "Guess the secret number between 1 and 1000:"

 
  read GUESS
  i=$((i+1))
  while [[ $GUESS != $WINNING_NUMBER ]]
    do
    i=$((i+1))
      if ! [[ $GUESS =~ ^[0-9]+$ ]]
        then 
        echo "That is not an integer, guess again:"
        read GUESS
      elif [[ $GUESS -gt $WINNING_NUMBER ]]
          then 
          echo "It's lower than that, guess again:"
          read GUESS
      elif [[ $GUESS -lt $WINNING_NUMBER ]]
      then
          echo "It's higher than that, guess again:"
          read GUESS
      fi
    done
    NEW_GAME=$($PSQL "insert into game(user_id,winning_number) values('$USERNAME_RESULT',$WINNING_NUMBER)")
      CURRENT_GAME_ID=$($PSQL "select max(game_id) from game where user_id = '$USERNAME_RESULT'")
    GUESS_COUNT=$($PSQL "update game set guesses_taken = $i where game_id=$CURRENT_GAME_ID")
    echo "You guessed it in $i tries. The secret number was $WINNING_NUMBER. Nice job!"
  exit
}

#check in user
echo "Enter your username:"
read USERNAME
  USERNAME_CHECK=$($PSQL "select username from users where username = '$USERNAME'")
  USERNAME_RESULT=$($PSQL "select user_id from users where username = '$USERNAME'")
  if [[ -z $USERNAME_CHECK ]]
    then
      echo "Welcome, $USERNAME! It looks like this is your first time here."
      USER_INSERT=$($PSQL "insert into users(username) values('$USERNAME')")
      GAME_FUNCTION
      
  else
      GAMECOUNT=$($PSQL "select count(game_id) from game where user_id = $USERNAME_RESULT")
      BEST=$($PSQL "select min(guesses_taken) from game where user_id = $USERNAME_RESULT") 
      echo -e "Welcome back, $USERNAME! You have played $GAMECOUNT games, and your best game took $BEST guesses."
      GAME_FUNCTION
  fi
