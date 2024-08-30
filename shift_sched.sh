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

# Function to check the number of people for a given team and shift
check_limit() {
<<<<<<< HEAD
	local team="$1"
	local shift="$2"
	local count

	count=$(grep -i "$team" "$output_file" | grep -i "$shift" | wc -l)
	if [ "$count" -ge 2 ]; then
		echo "Limit reached for $team in $shift shift."
		return 1
	else
		return 0
	fi
=======
  local team="$1"
  local shift="$2"
  local count

  count=$(grep -i "$team" "$output_file" | grep -i "$shift" | wc -l)
  if [ "$count" -ge 2 ]; then
    echo "Limit reached for $team in $shift shift."
    return 1
  else
    return 0
  fi
>>>>>>> 2a0600f6f9bfbc8c2a3fb31dd8d23998093854a0
}

# Function to get the total number of people for all teams and shifts
total_count() {
<<<<<<< HEAD
	local total
	total=$(grep -i "$1" "$output_file" | grep -i "$2" | wc -l)
	echo "$total"
=======
  local total
  total=$(grep -i "$1" "$output_file" | grep -i "$2" | wc -l)
  echo "$total"
>>>>>>> 2a0600f6f9bfbc8c2a3fb31dd8d23998093854a0
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

<<<<<<< HEAD
	# Check if adding a new entry exceeds the limit
	if check_limit "$team" "$shift"; then
		# Encode the input and store it in the file
		encoded_data=$(encode_data "$name" "$shift" "$team")
		echo "$encoded_data" >>$output_file

		echo "Data encoded and stored."
	else
		echo "Cannot add more people to $team in $shift shift."
		exit 1
	fi
=======
  # Check if adding a new entry exceeds the limit
  if check_limit "$team" "$shift"; then
    # Encode the input and store it in the file
    encoded_data=$(encode_data "$name" "$shift" "$team")
    echo "$encoded_data" >> $output_file

    echo "Data encoded and stored."
  else
    echo "Cannot add more people to $team in $shift shift."
  fi
>>>>>>> 2a0600f6f9bfbc8c2a3fb31dd8d23998093854a0
done

