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
		echo "1. NO PLAY, Player Stays At Same position - "$position
		echo
	elif(($n==2))
	then
		echo "2. Ladder is Present At Position - " $position
		echo
			position=$(($position+$res))
			#UserCase_5
			if(($position==100))
			then
				break
			elif(($position>100))
			then
				position=$(($position-$res))
			fi
	elif(($n==3))
	then
		echo "3. Snake is Present At Position - " $position
		echo
		#UserCase_4
		if((position>=$res))
		then
			position=$(($position-$res))
		else
			position=0
		 fi
	fi
	return $position
}
#UserCase_4
p=0
while((p<100))
do
	#UserCase_6
	DiceRoll=$(($DiceRoll+1))
	Play
	p=$?
done
echo "<<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"
echo "\m/    Player Position is At : $p    \m/"
echo "   No of Time Dice Rolled : $DiceRoll   " 
echo "            Player Wins"
echo "<<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"
