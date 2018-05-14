#!/bin/bash
#Intro To Unix
#Project 1 - 10/15/2015
#Nhan Pham
# Declare and define variables
array_symbol=('#' '$' '%' '&' '*' '@')
trails=10
right_guess=0
right_pos=0
unset guess0
unset guess1
unset guess2
unset guess3
echo "Welcome to Mindmaster!"
echo "Press y to start the game! " 
read a
start=$a	#read the user input
if [ $start = "y" ]; 
	then
	for ((i=0; i <= 3; i++)) ; do
		pick[i]="${array_symbol[$RANDOM%5]}" #genarate random value to select the code
	done
	pick0="${pick[0]}"
	pick1="${pick[1]}"
	pick2="${pick[2]}"
	pick3="${pick[3]}"
fi
	echo "Let's play!!"
while [ $trails -gt 0 ] ; do #checking if there is still 10 trails left
	let "right_guess=0"
	let "right_pos=0"
	
	echo "Your secret code: XXXX "
	echo "Number of trails left: $trails"
	echo "Enter your guess: "
	read g				#read in user guesses
	guess0=${g:0:1}
	guess1=${g:1:1}
	guess2=${g:2:1}
	guess3=${g:3:1}
	
	#if the input no enough, warn the user 
	if [ "$guess0" = ""] || [ "$guess1" = ""] ||[ "$guess2" = ""] || [ "$guess3" = ""] ; then
		echo "Please enter 4 guess!!!"
	else
		#checking the guesses with selected codes 
		if [ "$guess0" = "$pick0" ]; then
			let "right_pos+=1"
		
		elif [ "$guess0" = "$pick1" ] || [ "$guess0" = "$pick2" ] || [ "$guess0" = "$pick3" ]; then
			let "right_guess+=1"
		fi
	
		if [ "$guess1" = "$pick1" ]; then
			let "right_pos+=1"
		elif [ "$guess1" = "$pick0" ] || [ "$guess1" = "$pick2" ] || [ "$guess1" = "$pick3" ]; then
			let "right_guess+=1"
		fi
	
		if [ "$guess2" = "$pick2" ]; then
			let "right_pos+=1"
		elif [ "$guess2" = "$pick1" ] || [ "$guess2" = "$pick1" ] || [ "$guess2" = "$pick3" ]; then
			let "right_guess+=1"
		fi
	
		if  [ "$guess3" = "$pick3" ]; then
			let "right_pos+=1"
		elif [ "$guess3" = "$pick1" ] || [ "$guess3" = "$pick2" ] || [ "$guess3" = "$pick0" ]; then
			let "right_guess+=1"
		fi

		if [ $right_pos = "4" ]; then # checking if the guesses are all right
			echo "You win!!"
			break

		else
			let "trails-=1" #print out remaining trails
			echo "Right Guess: $right_guess!"
			echo "Right guess with right position: $right_pos!"

		fi
	fi
		
done
echo "This is your secret code: ${g[0]} ${g[1]} ${g[2]} ${g[3]}"
echo "Game Over!!"


