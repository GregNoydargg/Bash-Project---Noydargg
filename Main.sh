#!/bin/bash

# Regex for email validation
email_regex="^[a-zA-Z0-9]+[a-zA-Z0-9._%+-]*[a-zA-Z0-9]+@[a-zA-Z0-9]+[a-zA-Z0-9.-]*[a-zA-Z0-9]+\.[a-z]{2,}$"

# Input file
input_file="email.txt"

# help 
function display_usage() {
  echo "Usage: $0"
  echo "Options:"
  echo "Script that validate email address from a .txt file provided."
  echo "You can manually add emails into the .txt file provided to change values."
  echo "You can add and upload your own .txt file be sure to name 'email.txt' when uploaded in directory."
  echo "The user will then be prompt to confirm if ready to run script."
  echo " -h: Display this help information."
  echo "==============================" 

}

if [[ $# -eq 0 || "$1" == "-h" ]]; then
    display_usage
fi

# Ask user's input
read -p "Are you ready to run email validator? (Y/N): " answer

# Check if the user answered yes or no
if [[ "$answer" == "Y" || "$answer" == "y" ]]; then

  # valid emails
  valid_email_count=$(grep -E -c "$email_regex" "$input_file")
  valid_emails=$(grep -E "$email_regex" "$input_file")
  
  # invalid emails
  invalid_emails_count=$(grep -E -v "$email_regex" "$input_file")
  invalid_emails=$(grep -E -v "$email_regex" "$input_file")

  echo "Results:"
  echo "==============================" 
  echo "Number of valid email addresses: $valid_email_count"
  echo "Number of invalid email addresses: $valid_email_count"
  echo "=============================="
  echo "Valid emails:"
  echo "$valid_emails"
  echo "=============================="
  echo "Invalid emails:"
  echo "$invalid_emails"

elif [[ "$answer" == "N" || "$answer" == "n" ]]; then
  echo "Run when you're ready!"
  exit 1
else
  echo "Invalid input. Please answer with Y or N."
  exit 1
fi
