#!/bin/sh
start=0
position=0

#UserCase2
RandomDice()
{
num=$(($RANDOM%6+1))
return $num
}
RandomDice
echo "     Dice Thrown-"
echo "OutCome of Dice is:" $num

#UserCase_3
Play()
{
RandomDice
res=$?
n=$((RANDOM%3+1))
	if(($n==1))
	then
		echo "1. NO PLAY!!, Player Stays At Same position "
		echo
	elif(($n==2))
	then
		echo "2. Congo!!,Ladder is Present At Position  " 
		echo
			position=$(($position+$res))
	elif(($n==3))
	then
		echo "3. Awww!!,Snake is Present At Position  "
		echo
		if((position>=$res))
		then
			position=$(($position-$res))
		else
			position=0
		 fi
	fi
}
Play

