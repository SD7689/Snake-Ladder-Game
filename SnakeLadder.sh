#!/bin/sh

#UserCase_1
echo "Game Start"
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
		echo "NO PLAY, Player Stays At Same position "$position
		echo
	elif(($n==2))
	then
		echo "Ladder is Present At Position" $position
		echo
			position=$(($position+$res))
	elif(($n==3))
	then
		echo "Snake is Present At Position" $position
		echo
		if((position>=$res))
		then
			position=$(($position-$res))
		else
			position=0
		 fi
	fi
	return $position
}
while((p<100))
do
	Play
	p=$?
done
echo Player postion is: $p
