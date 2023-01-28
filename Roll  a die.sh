#Write a program in the following steps
a. Roll a die and find the number between 1 to 6
b. Repeat the Die roll and find the result each time
c. Store the result in a dictionary
d. Repeat till any one of the number has reached 10 times
e. Find the number that reached maximum times and the one that was for minimum times#

#!/bin/bash

# Step a: Roll a die and find the number between 1 and 6
die_roll=$((RANDOM % 6 + 1))
echo "Die roll: "$die_roll

# Step b and c: Repeat the die roll and find the result each time, store the result in a dictionary
declare -A results

while true; do
  die_roll=$((RANDOM % 6 + 1))
  if [ ${results[$die_roll]} ]; then
    results[$die_roll]=$((results[$die_roll] + 1))
  else
    results[$die_roll]=1
  fi
  echo "Die roll: "$die_roll
  # Step d: Repeat till any one of the number has reached 10 times
  for value in "${results[@]}"; do
    if [ $value -ge 10 ]; then
      break 2
    fi
  done
done

# Step e: Find the number that reached maximum times
max_num=0
max_value=0
for key in "${!results[@]}"; do
  if [ ${results[$key]} -gt $max_value ]; then
    max_num=$key
    max_value=${results[$key]}
  fi
done
echo "Number that reached maximum times: "$max_num

# Find the number that was for minimum times
min_num=0
min_value=11
for key in "${!results[@]}"; do
  if [ ${results[$key]} -lt $min_value ]; then
    min_num=$key
    min_value=${results[$key]}
  fi
done
echo "Number that was for minimum times: "$min_num
