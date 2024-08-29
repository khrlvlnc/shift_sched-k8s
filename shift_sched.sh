#!/bin/bash
 
# File to store encoded data
output_file="input.txt"
 
# Function to encode the input
encode_data() {
  echo "$1:$2:$3"
}
 
# Clear the file if it already exists
> $output_file
 
while true; do
  read -p "Enter name: " name
  if [[ "$name" == "print" ]]; then
    echo -e "\n--- Encoded Data ---"
    cat $output_file
    echo -e "\nExiting..."
    exit 0
  fi
 
  # Validate shift input
  while true; do
    read -p "Enter shift (morning/mid/night): " shift
    if [[ "$shift" == "morning" || "$shift" == "mid" || "$shift" == "night" ]]; then
      break
    else
      echo "Invalid shift. Please enter 'morning', 'mid', or 'night'."
    fi
  done
 
  # Validate team input
  while true; do
    read -p "Enter team (a1, a2, b1, b2, c1, c2, d1, d2): " team
    if [[ "$team" =~ ^[abcd][12]$ ]]; then
      break
    else
      echo "Invalid team. Please enter a valid team code (e.g., a1, b2, etc.)."
    fi
  done
 
  # Encode the input and store it in the file
  encoded_data=$(encode_data "$name" "$shift" "$team")
  echo "$encoded_data" >> $output_file
 
  echo "Data encoded and stored."
done