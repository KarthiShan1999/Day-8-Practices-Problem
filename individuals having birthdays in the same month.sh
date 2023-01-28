#Write a Program to generate a birth month of 50 individuals between the
year 92 & 93. Find all the individuals having birthdays in the same month.
Store it to finally print.#

# Step 1: Generate birth months of 50 individuals
declare -A birth_months
for i in {1..50}
do
  birth_months[$i]=$((RANDOM % 12 + 1))
done

# Step 2: Find individuals having birthdays in the same month
declare -A same_month_birthdays
for i in "${birth_months[@]}"
do
  if [[ -v same_month_birthdays[$i] ]]; then
    same_month_birthdays[$i]=$((same_month_birthdays[$i] + 1))
  else
    same_month_birthdays[$i]=1
  fi
done

# Step 3: Store and print the results
for month in "${!same_month_birthdays[@]}"
do
  if [ ${same_month_birthdays[$month]} -gt 1 ]; then
    echo "${same_month_birthdays[$month]} individuals have birthdays in month $month"
  fi
done
