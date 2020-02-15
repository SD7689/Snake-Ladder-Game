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

#UserCase_7_3
Play2()
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
p1=0
p2=0
flag=0
while(($p1<100 && $p2<100))
do
	#UserCase_6
	DiceRoll=$(($DiceRoll+1))
	#UserCase_7
	if(($flag==0))
	then
		Play2
		p1=$?
		count1=$(($count1+1))
		echo "Current Postion of Player1 is: $p1"
		echo 
		flag=$(($flag+1))
	else
		Play2
                p2=$?
                count2=$(($count2+1))
                echo "Current Postion of Player2 is: $p2"
                echo
                flag=$(($flag-1))
	fi
done
echo "Total No of Times Dice Rolled is : $DiceRoll"
if((p1==100))
then
echo "<<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"
echo "\m/   Player1 Position is At : $p1   \m/" 
echo " No of Times Player1 Dice Rolled : $count1" 
echo "            PLAYER1 Wins"
echo "<<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"
elif((p2==100))
then
echo "<<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"
echo "\m/   Player2 Position is At : $p2   \m/"
echo " No of Times Player2 Dice Rolled : $count2"
echo "            PLAYER2 Wins"
echo "<<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"
fi
