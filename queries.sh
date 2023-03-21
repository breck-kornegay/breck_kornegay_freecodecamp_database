echo "$($PSQL "select avg(winner_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "select round(avg(winner_goals), 2) from games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "select round(avg(winner_goals+opponent_goals), 16) from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "select max(winner_goals) from games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "select count(game_id) from games where winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select teams.name from teams full join games on teams.team_id = games.winner_id where year = 2018 and round like 'Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "select distinct(teams.name) from teams full join games as g1 on teams.team_id = g1.winner_id full join games as g2 on teams.team_id = g2.opponent_id where g1.year = 2014 and g1.round like 'Eighth-Final' or (g2.year = 2014 and g2.round like 'Eighth-Final') order by teams.name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select distinct(teams.name) from teams inner join games on teams.team_id = games.winner_id order by teams.name ")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "select  games.year, teams.name from teams full join games on teams.team_id = games.winner_id where round like 'Final' order by teams.name desc")"

echo -e "\nList of teams that start with 'Co':"
echo  "$($PSQL "select name from teams where name like 'Co%'")"
echo -e "\n