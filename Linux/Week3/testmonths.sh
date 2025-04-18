#!/bin/bash

#Write a script that takes as an argument a month in numerical form (i.e. between 1 and 12), and translates this to the month name and displays the result on standard out (the terminal).

#If no argument is given, or a bad number is given, the script should report the error and exit.

# Accept a number between 1 and 12 as
# an argument to this script, then return the
# the name of the month that corresponds to that number.

# Check to see if the user passed a parameter.
if [ $# -eq 0 ]
then
  echo "Error. Give as an argument a number between 1 and 12."
  exit 1
fi

# set month equal to argument passed for use in the script
month=$1

################################################
# The example of a case statement:

case $month in

  1)  echo "January" ;;
  2)  echo "February" ;;
  3)  echo "March" ;;
  4)  echo "April" ;;
  5)  echo "May" ;;
  6)  echo "June" ;;
  7)  echo "July" ;;
  8)  echo "August" ;;
  9)  echo "September" ;;
  10) echo "October" ;;
  11) echo "November" ;;
  12) echo "December" ;;
  *)
     echo "Error. No month matches: $month"
     echo "Please pass a number between 1 and 12."
     exit 2
     ;;
esac
exit 0