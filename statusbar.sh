#!/bin/sh
network() {
	conntype=$(ip route | awk '/default/ { print substr($5,1,1) }')

	if [ -z "$conntype" ]; then
		echo "no connection"
	elif [ "$conntype" = "e" ]; then
		echo " up"
	elif [ "$conntype" = "w" ]; then
		echo " up"
	fi
}

battery() {
	lvl=$(acpi | awk '{print $4}' | sed s/,//)
	if [ -z $(ls /sys/class/power_supply/) ]; then
		echo "  none"
	else
		if [ "$lvl" -ge 80 ]; then
			echo " $lvl%"
		elif [ "$lvl" -ge 60 ]; then
			echo " $lvl%"
		elif [ "$lvl" -ge 40 ]; then
			echo " $lvl%"
		elif [ "$lvl" -ge 20 ]; then
			echo " $lvl%"
		elif [ "$lvl" -ge 0 ]; then
			echo " $lvl%"	
		fi
	fi
}

volume_alsa() {

	mono=$(amixer -M sget Master | grep Mono: | awk '{ print $2 }')

	if [ -z "$mono" ]; then
		muted=$(amixer -M sget Master | awk 'FNR == 6 { print $7 }' | sed 's/[][]//g')
		vol=$(amixer -M sget Master | awk 'FNR == 6 { print $5 }' | sed 's/[][]//g; s/%//g')
	else
		muted=$(amixer -M sget Master | awk 'FNR == 5 { print $6 }' | sed 's/[][]//g')
		vol=$(amixer -M sget Master | awk 'FNR == 5 { print $4 }' | sed 's/[][]//g; s/%//g')
	fi

	if [ "$muted" = "off" ]; then
		echo " muted"
	else
		if [ "$vol" -ge 65 ]; then
			echo " $vol%"
		elif [ "$vol" -ge 40 ]; then
			echo " $vol%"
		elif [ "$vol" -ge 0 ]; then
			echo " $vol%"	
		fi
	fi
}
clock() {
	time=$(date +"%H:%M")
	echo " $time"
}
main() {
	while true; do
		xsetroot -name " $(network)  $(battery)  $(volume_alsa)  $(clock) "
		sleep 1
	done
}

main
