#!/bin/bash

#Fodor Tamás F97BJJ

menu_list(){
	clear
    	echo "Írd be a használni kívánt alprogram számát!"
   	echo "1. Számológép"
    	echo "2. Időjárás"
    	echo "3. Tippelős játék"    
    	echo "4. Kilépés"
    	read choice
    	
    	case $choice in
		1) calculator ;;
		2) weather ;;
		3) tippelos ;;
    		4) exit 0 ;;
    	esac
}

function pause(){
	read -p "$*"
}

function calculator(){
	echo "Add meg az első számot:"
	read a
	echo "Add meg a második számot:"
	read b

	echo "Válasz ki a műveletet:"
	echo "1. Összeadás"
	echo "2. Kivonás"
	echo "3. Szorzás"
	echo "4. Osztás"
	read choice

	case $choice in
		1) eredmeny=$(($a + $b)) ;;
		2) eredmeny=$(($a - $b)) ;;
		3) eredmeny=$(($a * $b)) ;;
		4) eredmeny=$(($a / $b)) ;;
	esac
	echo "Eredmény: $eredmeny"
	pause "Nyomj meg egy billentyűt a folytatáshoz!"
}

weather(){
	echo "Adj meg egy települést!"
	read a
	slash="/"
	w=wttr.in
	w+=$slash
	w+=$a
	curl $w?2?n 
	pause "Nyomj meg egy billentyűt a folytatáshoz!"
}

tippelos(){
	echo "Gondoltam egy számra."
	echo "Találd ki melyik szám az!"
	r=$((1 + $RANDOM % 100))
	db=$((0))
	guess=$((0))
	while [ $guess != $r ];
	do
		echo "Tipp: "
		read guess
		if [ $guess -lt $r ];
		then
			echo "Ettől azért nagyobb"
		fi
		if [ $guess -gt $r ];
		then
			echo "Ettől azért kisebb"
		fi
		((db++))
	done
	echo "Jól tippeltél, a helyes megfejtés: $r"
	echo "$db darab próbálkozásból sikerült megtippelned."
	pause "Nyomj meg egy billentyűt a folytatáshoz!"
}






while true
do
    menu_list
done
