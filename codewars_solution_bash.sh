# Count the number of cubes with paint on (8 kyu)
# https://www.codewars.com/kata/5763bb0af716cad8fb000580/train/shell
: '
echo "$((((($1+1)**3) - (($1-1)**3))))"
'


# String repeat (8 kyu)
# https://www.codewars.com/kata/57a0e5c372292dd76d000d7e/train/shell
: '
repeat=$1
string=$2
for i in `seq 1 $repeat`; do echo -n $string; done
echo
'


# Remove String Spaces
# https://www.codewars.com/kata/57eae20f5500ad98e50002c5/train/shell
: '
echo ${1// /}
'


# Function 1 - hello world
# https://www.codewars.com/kata/57eae20f5500ad98e50002c5/train/shell
: '
greet() {echo "hello world!"}
'


# Count the Digit
# https://www.codewars.com/kata/566fc12495810954b1000030
: '
nbDig() {
    nums="$(for i in `seq 0 $1`; do echo $(($i*$i)); done)"
    l=${#nums}
    b=${nums//$2/}
    b=${#b}
    ((b = l - b))
    echo $b
}
nbDig $1 $2
'


# Disemvowel Trolls
# https://www.codewars.com/kata/52fba66badcd10859f00097e
: '
echo "${1//[aeiouAEIOU]/}"
'


# Character with longest consecutive repetition
# https://www.codewars.com/kata/586d6cefbcc21eed7a001155/train/shell

#!/bin/bash

long_rep() {
    str=$1
    for ((i=0;i<${#str};i++));
    do
        char=${str:i:1}
        charnext=${str:i+1:1}
        if $char -eq $charnext;
        then
            
    done




}
# long_rep $1
long_rep "aaaabb"