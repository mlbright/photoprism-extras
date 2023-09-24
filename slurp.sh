#!/usr/bin/env bash

# Function to process STDIN line by line
process_lines() {
  while IFS= read -r line; do
    # Process each line here
    echo "Line: $line"
  done
}

# Function to read STDIN into a single variable
slurp_input() {
  input=""
  while IFS= read -r line; do
    # Read each line into the input variable
    input="$input$line"
  done
  # Process the entire input here
  echo "Slurped input: $input"
}

# Check if data is being piped into the script
if [ ! -t 0 ]; then
  # Data is being piped, so choose the appropriate function
  if [[ "$1" == "slurp" ]]; then
    slurp_input
  else
    process_lines
  fi
else
  # No data is being piped, provide instructions
  echo "Usage: $0 [slurp]"
  echo "If 'slurp' is provided as an argument, the script will read STDIN into a single variable."
  echo "Otherwise, it will process STDIN line by line."
fi
