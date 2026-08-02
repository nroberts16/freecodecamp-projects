#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "Enter your username: "
read NAME
USER_NAME=$($PSQL "SELECT username, user_id FROM participants WHERE username = '$NAME'")

if [[ -z $USER_NAME ]]
then
    INSERT_USER=$($PSQL "INSERT INTO participants(username) VALUES('$NAME')")
    USER_ID=$($PSQL "SELECT user_id FROM participants WHERE username = '$NAME'")
    echo -e "Welcome, $NAME! It looks like this is your first time here."
    echo -e "Guess the secret number between 1 and 1000:"
    read GUESS
else
    IFS="|" read USERNAME USER_ID <<< "$USER_NAME"
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID" | xargs)
    BEST_GAME=$($PSQL "SELECT min(score) FROM games WHERE user_id = $USER_ID" |xargs)
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    echo -e "Guess the secret number between 1 and 1000:"
    read GUESS
fi

#check if guess is an integer

while [[ ! $GUESS =~ ^[0-9]+$ ]]
do
  echo -e "That is not an integer, guess again:"
  read GUESS
done

INCREMENT_GAME=$($PSQL "UPDATE games SET game_num = game_num + 1 WHERE user_id = $USER_ID;")

#generate random number from 1-1000
SECRET_NUMBER=$(( (RANDOM % 1000) + 1 ))

#check to see if guess matches random number
while [[ "$GUESS" -ne "$SECRET_NUMBER" ]] 
do
    ((NUMBER_OF_GUESSES++))

    if [[ "$GUESS" -gt "$SECRET_NUMBER" ]]
    then
        echo "It's lower than that, guess again:"
        read GUESS
    elif [[ "$GUESS" -lt "$SECRET_NUMBER" ]] 
    then
        echo "It's higher than that, guess again:"
        read GUESS
    fi
done

((NUMBER_OF_GUESSES++))
NUM_GUESS=$($PSQL "INSERT INTO games(user_id, score) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"