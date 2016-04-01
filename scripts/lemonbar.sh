#!/bin/bash

# constants


spacing="   "
function jsonValue() {
    KEY=$1
    num=$2
    awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}

workspaces () {

    ws1="1 "
    ws2="2 "
    ws3="3 "
    ws4="4 "
    ws5="5 "
    ws6="6 "
    ws7="7 "
    ws8="8 "
    ws9="9 "
    ws10="10 "
    active="#F2BEEF"
    currentws=$(i3-msg -t get_workspaces | jq -r 'map(select(.focused))[0].num')
    totalws=$(i3-msg -t get_workspaces | jq -r 'map(.num)' | tail -n2 | head -1)
    #cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    wsstring=""
    case $currentws in
	1)
	echo -e "%{"F#F2BEEF"}${spacing}$ws1${spacing}%{F}%{A:i3-msg workspace 2:}${spacing}$ws2${spacing}%{A}%{A:i3-msg workspace 3:}${spacing}$ws3${spacing}%{A}%{A:i3-msg workspace 4:}${spacing}$ws4${spacing}%{A}%{A:i3-msg workspace 5:}${spacing}$ws5${spacing}%{A}%{A:i3-msg workspace 6:}${spacing}$ws6${spacing}%{A}%{A:i3-msg workspace 7:}${spacing}$ws7${spacing}%{A}%{A:i3-msg workspace 8:}${spacing}$ws8${spacing}%{A}%{A:i3-msg workspace 9:}${spacing}$ws9${spacing}%{A}%{A:i3-msg workspace 10:}${spacing}$ws10${spacing}%{A}"
	;;
	2) 
	echo "%{A:i3-msg workspace 1:}${spacing}$ws1${spacing}%{A}%{"F#F2BEEF"}${spacing}$ws2${spacing}%{F}%{A:i3-msg workspace 3:}${spacing}$ws3${spacing}%{A}%{A:i3-msg workspace 4:}${spacing}$ws4${spacing}%{A}%{A:i3-msg workspace 5:}${spacing}$ws5${spacing}%{A}%{A:i3-msg workspace 6:}${spacing}$ws6${spacing}%{A}%{A:i3-msg workspace 7:}${spacing}$ws7${spacing}%{A}%{A:i3-msg workspace 8:}${spacing}$ws8${spacing}%{A}%{A:i3-msg workspace 9:}${spacing}$ws9${spacing}%{A}%{A:i3-msg workspace 10:}${spacing}$ws10${spacing}%{A}"
	;;
	3)
	echo "%{A:i3-msg workspace 1:}${spacing}$ws1${spacing}%{A}%{A:i3-msg workspace 2:}${spacing}$ws2${spacing}%{A}%{"F#F2BEEF"}${spacing}$ws3${spacing}%{F}%{A:i3-msg workspace 4:}${spacing}$ws4${spacing}%{A}%{A:i3-msg workspace 5:}${spacing}$ws5${spacing}%{A}%{A:i3-msg workspace 6:}${spacing}$ws6${spacing}%{A}%{A:i3-msg workspace 7:}${spacing}$ws7${spacing}%{A}%{A:i3-msg workspace 8:}${spacing}$ws8${spacing}%{A}%{A:i3-msg workspace 9:}${spacing}$ws9${spacing}%{A}%{A:i3-msg workspace 10:}${spacing}$ws10${spacing}%{A}"
	;;
	4)
	echo "%{A:i3-msg workspace 1:}${spacing}$ws1${spacing}%{A}%{A:i3-msg workspace 2:}${spacing}$ws2${spacing}%{A}%{A:i3-msg workspace 3:}${spacing}$ws3${spacing}%{A}%{"F#F2BEEF"}${spacing}$ws4${spacing}%{F}%{A:i3-msg workspace 5:}${spacing}$ws5${spacing}%{A}%{A:i3-msg workspace 6:}${spacing}$ws6${spacing}%{A}%{A:i3-msg workspace 7:}${spacing}$ws7${spacing}%{A}%{A:i3-msg workspace 8:}${spacing}$ws8${spacing}%{A}%{A:i3-msg workspace 9:}${spacing}$ws9${spacing}%{A}%{A:i3-msg workspace 10:}${spacing}$ws10${spacing}%{A}"
	;;
	5)
	echo "%{A:i3-msg workspace 1:}${spacing}$ws1${spacing}%{A}%{A:i3-msg workspace 2:}${spacing}$ws2${spacing}%{A}%{A:i3-msg workspace${spacing} 3:}${spacing}$ws3${spacing}%{A}%{A:i3-msg workspace 4:}${spacing}$ws4${spacing}%{A}%{"F#F2BEEF"}${spacing}$ws5${spacing}%{F}%{A:i3-msg workspace 6:}${spacing}$ws6${spacing}%{A}%{A:i3-msg workspace 7:}${spacing}$ws7${spacing}%{A}%{A:i3-msg workspace 8:}${spacing}$ws8${spacing}%{A}%{A:i3-msg workspace 9:}${spacing}$ws9${spacing}%{A}%{A:i3-msg workspace 10:}${spacing}$ws10${spacing}%{A}"
	;;
	6)
	echo "%{A:i3-msg workspace 1:}${spacing}$ws1${spacing}%{A}%{A:i3-msg workspace 2:}${spacing}$ws2${spacing}%{A}%{A:i3-msg workspace${spacing} 3:}${spacing}$ws3${spacing}%{A}%{A:i3-msg workspace 4:}${spacing}$ws4${spacing}%{A}%{A:i3-msg workspace 5:}${spacing}$ws5${spacing}%{A}%{"F#F2BEEF"}${spacing}$ws6${spacing}%{F}%{A:i3-msg workspace 7:}${spacing}$ws7${spacing}%{A}%{A:i3-msg workspace 8:}${spacing}$ws8${spacing}%{A}%{A:i3-msg workspace 9:}${spacing}$ws9${spacing}%{A}%{A:i3-msg workspace 10:}${spacing}$ws10${spacing}%{A}"
	;;
	7)
	echo "%{A:i3-msg workspace 1:}${spacing}$ws1${spacing}%{A}%{A:i3-msg workspace 2:}${spacing}$ws2${spacing}%{A}%{A:i3-msg workspace${spacing} 3:}${spacing}$ws3${spacing}%{A}%{A:i3-msg workspace 4:}${spacing}$ws4${spacing}%{A}%{A:i3-msg workspace 5:}${spacing}$ws5${spacing}%{A}%{A:i3-msg workspace 6:}${spacing}$ws6${spacing}%{A}%{"F#F2BEEF"}${spacing}$ws7${spacing}%{F}%{A:i3-msg workspace 8:}${spacing}$ws8${spacing}%{A}%{A:i3-msg workspace 9:}${spacing}$ws9${spacing}%{A}%{A:i3-msg workspace 10:}${spacing}$ws10${spacing}%{A}"
	;;
	8)
	echo "%{A:i3-msg workspace 1:}${spacing}$ws1${spacing}%{A}%{A:i3-msg workspace 2:}${spacing}$ws2${spacing}%{A}%{A:i3-msg workspace${spacing} 3:}${spacing}$ws3${spacing}%{A}%{A:i3-msg workspace 4:}${spacing}$ws4${spacing}%{A}%{A:i3-msg workspace 5:}${spacing}$ws5${spacing}%{A}%{A:i3-msg${spacing}${spacing}  workspace 6:}${spacing}$ws6${spacing}%{A}%{A:i3-msg workspace 7:}${spacing}$ws7${spacing}%{A}%{"F#F2BEEF"}${spacing}$ws8${spacing}%{F}%{A:i3-msg workspace 9:}${spacing}$ws9${spacing}%{A}%{A:i3-msg workspace 10:}${spacing}$ws10${spacing}%{A}"
	;;
	9)
	echo "%{A:i3-msg workspace 1:}${spacing}$ws1${spacing}%{A}%{A:i3-msg workspace 2:}${spacing}$ws2${spacing}%{A}%{A:i3-msg workspace${spacing} 3:}${spacing}$ws3${spacing}%{A}%{A:i3-msg workspace 4:}${spacing}$ws4${spacing}%{A}%{A:i3-msg workspace 5:}${spacing}$ws5${spacing}%{A}%{A:i3-msg${spacing}${spacing}  workspace 6:}${spacing}$ws6${spacing}%{A}%{A:i3-msg workspace 7:}${spacing}$ws7${spacing}%{A}%{A:i3-msg workspace 8:}${spacing}$ws8${spacing}%{A}%{"F#F2BEEF"}${spacing}$ws9${spacing}%{F}%{A:i3-msg workspace 10:}${spacing}$ws10${spacing}%{A}"
	;;
	10)
x	echo "%{A:i3-msg workspace 1:}${spacing}$ws1${spacing}%{A}%{A:i3-msg workspace 2:}${spacing}$ws2${spacing}%{A}%{A:i3-msg workspace${spacing} 3:}${spacing}$ws3${spacing}%{A}%{A:i3-msg workspace 4:}${spacing}$ws4${spacing}%{A}%{A:i3-msg workspace 5:}${spacing}$ws5${spacing}%{A}%{A:i3-msg${spacing}${spacing}  workspace 6:}${spacing}$ws6${spacing}%{A}%{A:i3-msg workspace 7:}${spacing}$ws7${spacing}%{A}%{A:i3-msg workspace 8:}${spacing}$ws8${spacing}%{A}%{A:i3-msg workspace 9:}${spacing}$ws9${spacing}%{A}%{"F#F2BEEF"}${spacing}$ws10${spacing}%{F}"
	;;
    esac
}

gettime () {
    hour=$(date '+%H:%M')
    echo "${spacing}  ${hour}${spacing}"
}

networkstatus () {
    if [ $(nmcli --fields STATE -t d | head -1) = "connected" ]
    then
        echo "${spacing}  Connected${spacing}"
    else
        echo "${spacing}  No Connection${spacing}"
    fi
}

cpu_temperature () {
    temperature=$(sensors | tail -6 | head -1 | awk -F+ '{ print $2 }' | awk -F° '{ print $1 }' | awk -F. '{ print $1 }')
    if [ ${temperature} -gt 75 ]; then
        echo "${spacing}  ${temperature}°C${spacing}"
    else
        echo ""
    fi
}


diskspace () {
    usage=$(df -h | grep /dev/sda1 | awk -F' ' '{ print $5 }' | awk -F% '{ print $1 }')
    if [ ${usage} -gt 50 ]; then
        echo "${spacing}  ${usage}%${spacing}"
    else
	echo ""
    fi
}

volume () {
    state=$(amixer get Master | grep "Front Left: " | awk -F'[' '{print $3}' | awk -F ']' '{print $1}')
    volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed   -e 's,.* \([0-9][0-9]*\)%.*,\1,' | awk -F" " '{ print $1 }')
    if [ ${state} == 'on' ]; then
	if [ "${volume}" -eq 0 ]; then
		echo "${spacing}  ${volume}%${spacing}"
	elif [ "${volume}" -gt 0 ] && [ "${volume}" -lt 50 ]; then
		echo "${spacing}  ${volume}%${spacing}"
	else
		echo "${spacing}  ${volume}%${spacing}"
	fi
    else
	echo "${spacing}  ${volume}%${spacing}"
    fi
}

while true; do
    echo "%{l}$(workspaces)%{r}$(cpu_temperature)$(diskspace)$(volume)$(networkstatus)$(gettime)%{r}"
    sleep 0.01
done
