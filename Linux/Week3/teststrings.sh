#!/bin/bash

#Task
#Write a script which reads two strings as arguments and then:

#Tests to see if the first string is of zero length, and if the other is of non-zero length, telling the user of both results.
#Determines the length of each string, and reports on which one is longer or if they are of equal length.
#Compares the strings to see if they are the same, and reports on the result.

# check two string arguments were given

[[ $# -lt 2 ]] && \
echo "Usage: Give two strings as arguments" && exit 1
str1=$1
str2=$2

#------------------------------------------------------------------

## test command

echo "Is string 1 zero lenght? Value of 1 means FALSE"
[ -z "$str1" ]
echo $?

# note if $str1 is empty, the test [ -z $str1 ] would fail
#                              but [[ -z $str1 ]] succeeds
#         i.e., with [[ ]] it works even without the quotes
echo "Is string 2 nonzero length? Value of 0 means TRUE;"
[ -n $str2 ]
echo $?

## comparing the lengths of two string

len1=${#str1}
len2=${#str2}
echo length of string1 = $len1, length of string2 = $len2

if [ $len1 -gt $len2 ]
then
    echo "String 1 is longer than string 2"
else
    if [ $len2 -gt $len1 ]
    then
        echo "String 2 is longer than string 1"
    else
        echo "String 1 is the same length as string 2"
    fi
fi

## compare the two strings to see if they are the same

if [[ $str1 == $str2 ]]
then
    echo "String 1 is the same as string 2"
else
    if [[ $str1 != $str2 ]]
    then
        echo "String 1 is not the same as string 2"
    fi
fi