#!/bin/bash


#max people per shift per team
MAX_PER_SHIFT=2

#List of valid shifts and teams
VALID_SHIFTS=("Morning", "Mid", "Night")
VALID_TEAMS=("A1" "A2" "B1" "B2" B3")

#Output file for storing user inputs
STORAGE_FILE="shift_schedule_storage.txt



#Logic to make inputs persistent
if [[ -f $STORAGE_FILE ]];
then
	while IFS=, read -r name shift team;
	do
		key="${team}_${shift}"
		team_shifts[$key]=$((team_shifts[$key] + 1))
	done < "$STORAGE_FILE"
fi


# write a function  here for error handling or validating of input name,shift,team





# Loop for entering shecdule

while true;
do
	read -p "Enter name: " name
	read -p "Enter shift: " shift
	read -p "Enter team: " team


	# Instance when user input is "print".
	if [[ $name == "print" ]]; then
		
		#Write a code about printing all input names, shifts, teams
		#example: cat $STORAGE_FILE 

		echo "Exiting the loop"
		break
	fi

	
	#Write a code here to validate the inputs, you can call the function you created

	
						
done

echo "Shift schedule completed."
