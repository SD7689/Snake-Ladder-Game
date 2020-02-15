#!/bin/sh
echo
echo "           <<~~~~~~ Play SnaKe & Ladder## ~~~~~>>"
echo
MyBoard()
{
declare -A array
num=101
for((i=0; i<10; i++))
do
       if(($i%2==0))
       then
               for((j=0; j<10; j++))
               do
               num=$(($num-1))
               array[$i,$j]=$num
               done
       else
               for((j=9; j>=0; j--))
               do
               num=$(($num-1))
               array[$i,$j]=$num
               done
       fi
done
echo "|----------------------------------------------------------|"
       temp=101
       for((i=0; i<10; i++))
       do
               for((j=0; j<10; j++))
               do
                       if(($temp<=10))
                       then
                               temp=$(($temp-1))
                               echo -n "|  "
                               echo -n "$((array[$i,$j])) |"
                       else
                               temp=$(($temp-1))
                               echo -n "| "
                               echo -n "$((array[$i,$j])) |"
                       fi
               done
               echo
               echo "|----------------------------------------------------------|"
       done
}
MyBoard

echo "<<=======WELCOME TO SNAKE & LADDER GAME IN SHELL SCRIPT=======>>"

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
		echo "2. Congo!!,Ladder is Present At Position - " $position
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
		echo "3. Awww!!,Snake is Present At Position - " $position
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
echo "      No of Time Dice Rolled : $DiceRoll   " 
echo "            Player Wins"
echo "<<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"
