#!/bin/sh
start=0
postion=0

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
		echo "NO PLAY, Player Stays At Same postion."
	elif(($n==2))
	then
		echo "Ladder is Present At Postion"
		if(($postion+$res<100))
		then
			postion=$(($(($postion+$res))))
		elif(($postion+$res==100))
		then
			echo "Player Wins."
		fi
	elif(($n==3))
	then
		echo "Snake is Present"
		if(($postion==0))
		then
			echo "Player Stays at Same Postion" 
		else
			postion=$(($(($postion+$res))))
		 fi
	fi
	return $postion
}
Play
echo Player postion is: $?
