#!/bin/bash
 
# File to store encoded data
output_file="input.txt"
 
# Function to encode the input
encode_data() {
  echo "$1:$2:$3"
}
 

# Fixed indentation
# Clear the file if it already exists
>>$output_file

# Read the input.txt cat input.txt | grep team | grep -wc shift

# function for calling

max_number() {
	cat $output_file | grep -i a1 | grep -i morning | wc -l
	cat $output_file | grep -i a1 | grep -i mid | wc -l
	cat $output_file | grep -i a1 | grep -i night | wc -l

	cat $output_file | grep -i a2 | grep -i morning | wc -l
	cat $output_file | grep -i a2 | grep -i mid | wc -l
	cat $output_file | grep -i a2 | grep -i night | wc -l

	cat $output_file | grep -i b1 | grep -i morning | wc -l
	cat $output_file | grep -i b1 | grep -i mid | wc -l
	cat $output_file | grep -i b1 | grep -i night | wc -l

	cat $output_file | grep -i b2 | grep -i morning | wc -l
	cat $output_file | grep -i b2 | grep -i mid | wc -l
	cat $output_file | grep -i b2 | grep -i night | wc -l

	cat $output_file | grep -i b3 | grep -i morning | wc -l
	cat $output_file | grep -i b3 | grep -i mid | wc -l
	cat $output_file | grep -i b3 | grep -i night | wc -l
}

while true; do

	read -p "Enter name: " name
	name=$(echo "$name" | tr '[:lower:]' '[:upper:]')

	if [[ "$name" == "PRINT" ]]; then

		echo -e "\n--- Encoded Data ---"
		echo -e "\n--- A1 ---"
		cat $output_file | grep -i a1 | grep -i morning | awk -F: '{print $1",", $2",",  "6AM - 3PM"}'
		cat $output_file | grep -i a1 | grep -i mid | awk -F: '{print $1",", $2",",  "2PM - 11PM"}'
		cat $output_file | grep -i a1 | grep -i night | awk -F: '{print $1",", $2",",  "10PM - 7AM"}'

		echo -e "\n--- A2 ---"
		cat $output_file | grep -i a2 | grep -i morning | awk -F: '{print $1",", $2",",  "6AM - 3PM"}'
		cat $output_file | grep -i a2 | grep -i mid | awk -F: '{print $1",", $2",",  "2PM - 11PM"}'
		cat $output_file | grep -i a2 | grep -i night | awk -F: '{print $1",", $2",",  "10PM - 7AM"}'

		echo -e "\n--- B1 ---"
		cat $output_file | grep -i b1 | grep -i morning | awk -F: '{print $1",", $2",",  "6AM - 3PM"}'
		cat $output_file | grep -i b1 | grep -i mid | awk -F: '{print $1",", $2",",  "2PM - 11PM"}'
		cat $output_file | grep -i b1 | grep -i night | awk -F: '{print $1",", $2",",  "10PM - 7AM"}'

		echo -e "\n--- B2 ---"
		cat $output_file | grep -i b2 | grep -i morning | awk -F: '{print $1",", $2",",  "6AM - 3PM"}'
		cat $output_file | grep -i b2 | grep -i mid | awk -F: '{print $1",", $2",",  "2PM - 11PM"}'
		cat $output_file | grep -i b2 | grep -i night | awk -F: '{print $1",", $2",",  "10PM - 7AM"}'

		echo -e "\n--- B3 ---"
		cat $output_file | grep -i b3 | grep -i morning | awk -F: '{print $1",", $2",",  "6AM - 3PM"}'
		cat $output_file | grep -i b3 | grep -i mid | awk -F: '{print $1",", $2",",  "2PM - 11PM"}'
		cat $output_file | grep -i b3 | grep -i night | awk -F: '{print $1",", $2",",  "10PM - 7AM"}'

		echo -e "\nExiting..."
		exit 0
	fi

	# Validate shift input
	while true; do
		read -p "Enter shift (morning/mid/night): " shift
		shift=$(echo "$shift" | tr '[:lower:]' '[:upper:]')

		if [[ "$shift" == "MORNING" || "$shift" == "MID" || "$shift" == "NIGHT" ]]; then
			break
		else
			echo "Invalid shift. Please enter 'morning', 'mid', or 'night'."
			exit 1
		fi
	done

	# Validate team input
	while true; do
		read -p "Enter team (a1, a2, b1, b2, b3): " team
		team=$(echo "$team" | tr '[:lower:]' '[:upper:]')

		if [[ "$team" == "A1" || "$team" == "A2" || "$team" == "B1" || "$team" == "B2" || "$team" == "B3" ]]; then
			break
		else
			echo "Invalid team. Please enter a valid team code (e.g., a1, b2, etc.)."
			exit 1
		fi
	done

	# Encode the input and store it in the file
	encoded_data=$(encode_data "$name" "$shift" "$team")
	echo "$encoded_data" >>$output_file

	echo "Data encoded and stored."
done
