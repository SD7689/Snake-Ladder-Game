#!/bin/sh
echo
echo "           <<~~~~~~ Play SnaKe & Ladder## ~~~~~>>"
echo
#UserCase_1
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

#UserCase_1
echo "Game Start"
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
