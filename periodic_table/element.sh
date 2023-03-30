PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
#variable to accept parameters
PARAMETER_RESULT=$($PSQL "select atomic_number from elements where atomic_number::varchar(255) = '$1' or name = '$1' or symbol = '$1'")

#function for output
OUTPUT() {
  ELEMENT_INFO=$($PSQL "select elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius
  from
  elements inner join properties on elements.atomic_number=properties.atomic_number
  inner join types on properties.type_id =types.type_id 
  where elements.atomic_number=$PARAMETER_RESULT")
  echo "$ELEMENT_INFO" | while read ATOM_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELT BAR BOIL
  do
  echo -e "The element with atomic number $ATOM_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius." 
  done
  exit
}
#logic to check for input
if [[ -z $1 ]]
 then
 echo -e "Please provide an element as an argument."
 exit
fi
if [[ -z $PARAMETER_RESULT ]]
  then
    echo -e "I could not find that element in the database."
    exit
  else OUTPUT
fi
