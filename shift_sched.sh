#!/bin/bash

# File to store encoded data
output_file="input.txt"

# Function to encode the input
encode_data() {
	echo -e "${GREEN}$1${NC}:${YELLOW}$2${NC}:${BLUE}$3"
}

# Define color and text formatting codes
BLUE='\033[0;34m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color or Reset
THUMBS_UP="👍"

# Clear the file if it already exists
>>$output_file

# Function to check the number of people for a given team and shift
check_limit() {

	local team="$1"
	local shift="$2"
	local count

	count=$(grep -i "$team" "$output_file" | grep -i "$shift" | wc -l)
	if [ "$count" -ge 2 ]; then
		echo -e "\n${RED}Limit reached for ${YELLOW}$team ${RED}in ${YELLOW}$shift ${RED}shift."
		return 1
	else
		return 0
	fi

}

# Function to get the total number of people for all teams and shifts
total_count() {

	local total
	total=$(grep -i "$1" "$output_file" | grep -i "$2" | wc -l)
	echo "$total"

}

while true; do

	read -p "$(echo -e "\n${BLUE}${BOLD}${UNDERLINE}=============================${NC}\n${GREEN}${BOLD}Enter Name:${NC} ")" name
	name=$(echo "$name" | tr '[:lower:]' '[:upper:]')

	if [[ "$name" == "PRINT" ]]; then

		echo -e "\n${BLUE}${BOLD}${UNDERLINE}=============================${YELLOW}ENCODED DATA${BLUE}${BOLD}${UNDERLINE}=============================${NC}"
		echo -e "\n${BLUE}${BOLD}${UNDERLINE}--- ${YELLOW}A1 ${BLUE}${BOLD}${UNDERLINE}---${NC}"
		cat $output_file | grep -i a1 | grep -i morning | awk -F: '{print $1",", $2",",  "6AM - 3PM"}'
		cat $output_file | grep -i a1 | grep -i mid | awk -F: '{print $1",", $2",",  "2PM - 11PM"}'
		cat $output_file | grep -i a1 | grep -i night | awk -F: '{print $1",", $2",",  "10PM - 7AM"}'

		echo -e "\n${BLUE}${BOLD}${UNDERLINE}--- ${YELLOW}A2 ${BLUE}${BOLD}${UNDERLINE}---${NC}"
		cat $output_file | grep -i a2 | grep -i morning | awk -F: '{print $1",", $2",",  "6AM - 3PM"}'
		cat $output_file | grep -i a2 | grep -i mid | awk -F: '{print $1",", $2",",  "2PM - 11PM"}'
		cat $output_file | grep -i a2 | grep -i night | awk -F: '{print $1",", $2",",  "10PM - 7AM"}'

		echo -e "\n${BLUE}${BOLD}${UNDERLINE}--- ${YELLOW}B1 ${BLUE}${BOLD}${UNDERLINE}---${NC}"
		cat $output_file | grep -i b1 | grep -i morning | awk -F: '{print $1",", $2",",  "6AM - 3PM"}'
		cat $output_file | grep -i b1 | grep -i mid | awk -F: '{print $1",", $2",",  "2PM - 11PM"}'
		cat $output_file | grep -i b1 | grep -i night | awk -F: '{print $1",", $2",",  "10PM - 7AM"}'

		echo -e "\n${BLUE}${BOLD}${UNDERLINE}--- ${YELLOW}B2 ${BLUE}${BOLD}${UNDERLINE}---${NC}"
		cat $output_file | grep -i b2 | grep -i morning | awk -F: '{print $1",", $2",",  "6AM - 3PM"}'
		cat $output_file | grep -i b2 | grep -i mid | awk -F: '{print $1",", $2",",  "2PM - 11PM"}'
		cat $output_file | grep -i b2 | grep -i night | awk -F: '{print $1",", $2",",  "10PM - 7AM"}'

		echo -e "\n${BLUE}${BOLD}${UNDERLINE}--- ${YELLOW}B3 ${BLUE}${BOLD}${UNDERLINE}---${NC}"
		cat $output_file | grep -i b3 | grep -i morning | awk -F: '{print $1",", $2",",  "6AM - 3PM"}'
		cat $output_file | grep -i b3 | grep -i mid | awk -F: '{print $1",", $2",",  "2PM - 11PM"}'
		cat $output_file | grep -i b3 | grep -i night | awk -F: '{print $1",", $2",",  "10PM - 7AM"}'

		echo -e "\n${RED}Exiting..."
		exit 0
	fi

	# Validate shift input
	while true; do
		read -p "$(echo -e "\n${GREEN}${BOLD}Enter Shift ${YELLOW}(MORNING, MID, NIGHT)${NC}: ")" shift
		shift=$(echo "$shift" | tr '[:lower:]' '[:upper:]')

		if [[ "$shift" == "MORNING" || "$shift" == "MID" || "$shift" == "NIGHT" ]]; then
			break
		else
			echo -e "\n${RED}INVALID SHIFT! Please enter a valid shift code ${NC}(e.g., ${YELLOW}MORNING, MID, NIGHT.${NC})."
			echo -e "\n${RED}Exiting..."
			exit 1
		fi
	done

	# Validate team input
	while true; do
		read -p "$(echo -e "\n${GREEN}${BOLD}Enter Team ${YELLOW}(A1,A2,B1.B2,B3)${NC}: ")" team
		team=$(echo "$team" | tr '[:lower:]' '[:upper:]')

		if [[ "$team" == "A1" || "$team" == "A2" || "$team" == "B1" || "$team" == "B2" || "$team" == "B3" ]]; then
			echo -e "${BLUE}${BOLD}${UNDERLINE}=============================${NC}"
			break
		else
			echo -e "\n${RED}INVALID TEAM! PLEASE ENTER A VALID TEAM CODE ${NC}(e.g., ${YELLOW}A1, B2, etc.${NC})."
			echo -e "\n${RED}Exiting..."
			exit 1
		fi
	done

	# Check if adding a new entry exceeds the limit
	if check_limit "$team" "$shift"; then
		# Encode the input and store it in the file
		encoded_data=$(encode_data "$name" "$shift" "$team")
		echo "$encoded_data" >>$output_file

		echo -e "\n${GREEN}DATA ENCODED AND STORED. ${THUMBS_UP}"
	else
		echo -e "\n${RED}CANNOT ADD MORE PEOPLE TO ${YELLOW} $team ${RED}IN ${YELLOW}$shift ${RED}SHIFT."
		echo -e "\n${RED}Exiting..."
		exit 1
	fi

done
