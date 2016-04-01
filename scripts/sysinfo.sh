 #
#############

FULL=━
EMPTY=━
name=$USER
host=`hostname`
battery=/sys/class/power_supply/BAT1
distro="Manjaro"
kernel=`uname -r`
pkgs=`pacman -Qqs | wc -l`
wm='i3-gaps'
shell="${SHELL##*/}"
bdayclean="$(date -d"$(ls -alct --full-time / | awk '/lost\+found/ {printf  $6 " " $7}')" "+%d %b %Y %k:%M")"
uptimePrefix="up "
uptime=$( uptime -p | sed "s/^$uptimePrefix//")
if pgrep "mocp" > /dev/null; then
	mocpstate=$(mocp -Q "%state")
	mocpplaying=$(mocp -Q "%artist - %song")
fi

#####################
# Draw DeaDSeC logo #
#####################

printf "\e[1;36m " 
cat << 'EOF'
        　　　　　　　　　　　　　　 　 　 　 　 ,,,,,,_
　　　　　　　　　　　　　　　　　,,,,,iiiilllllllllllllliii,,,,
　　　　　　,,,,,_　　　.,,,,,,,,,,iiiiiiillllllllllllllllllllllllllllllllllll丶
　　　　　　ﾞllllllllliiillllllllllllllllllllllll!!!!llllllllllllllllllllllll!!ﾞ
　　　　　　 ﾞ!llllllllllllllllllll!!!ﾞﾞﾞ° ,,illllllllllllllllllll!ﾞ゜
　 　 　 　 　 ﾞ!lllllll!!lﾞﾞ’　　　.,,illlllllllllllllll!!ﾞ゜
　　　　　　　　 ＾　　　　　.,,illllllllllllllll!!ﾞ゜
　　　　　　　　　　　　　 ,,il,.-､lllllll!ﾞ°
　　　　　　　　　　　　 ,"^`:ｒ"ll!lﾞ゜
　　　　　 　 　 　 　 ,,,_{ﾂ=''}､_,_,,
　　　　 　 　 　 　 ,,iﾊ::::::一::::::::ﾊ
　　　 　 　 　 　 ,,ill/ i::::::乙::::::i　 i　　　　　　 liiii,,
　　　　　　　　 ,,illl.{　.i:::::::::::::::::i　 i 　 　 　 　 'llllllli,,
　　　　　　　 ,,illllllllヾ,,}二二二{ﾑﾉ 　 　 　 　 lllllllllli,,
　　　　　　　,illlllllllﾞ　　i:::::::::::::::::i　 　 　 　 　 ,lllllllllllllii,
　　　　　　　llllllllllli,_　.i:::::::;'.i:::::::i　　　　　　,,,,illlllllllllllllllli,
　　　　　　　!lllllllllllllll i::::::;'.ii.i:::::::i,,,,,,iiiiiiiiiiiiiillllllllllllllllllllllllllllll
　　　　　　　 ﾞﾞ!!lllllllll.i:::::;'.iiii.i:::::::illllllllllllllllllllllllllllllllllllllllllllllll
　　　　　　　　　 ﾞﾞ ,､ｲ l..iiiiii..}　ﾄ, lllllllllllllllllllllllllllll!!!!!!!lﾞﾞﾞ゜
　　　　　　　　　　 .￣.゛ .゛” .゛~゛　”””””￣￣
EOF
###########################
# Function to draw status #
###########################
draw()
{
  perc=$1
  size=$2
  inc=$(( perc * size / 100 ))
  out=
  if [ -z $3 ]
  then
	  color="37"
  else
    color="$3"
  fi 
  for v in `seq 0 $(( size - 1 ))`; do
    test "$v" -le "$inc"   \
    && out="${out}\e[1;${color}m${FULL}" \
    || out="${out}\e[0;${color}m${EMPTY}"
  done
  printf $out
}
########################
# Print pc information #
########################
printf " \e[0m\n"
i=0
while [ $i -le 19 ] 
do
  printf "████"
  i=$(($i+1))
done
printf " \e[0m\n\n"
printf " \e[1;36m  Distro:   \e[0m$distro\n"
printf " \e[1;36m  Kernel:   \e[0m$kernel\n"
printf " \e[1;36m  Birthday: \e[0m$bdayclean\n"
printf " \e[1;36m  Packages: \e[0m$pkgs\n"
printf " \e[1;36m  Shell:    \e[0m$shell\n"
printf " \e[1;36m  WM:       \e[0m$wm\n"
printf " \e[1;36m  Uptime:   \e[0m$uptime\n"
if [ "${mocpstate}" == "PLAY" ]; then
	printf " \e[1;36m  Song:     \e[0m$mocpplaying\n"
fi
printf "\e[0m\n"
i=0
while [ $i -le 19 ] 
do
printf "████"
  i=$(($i+1))
done
printf " \e[0m\n\n"
#######################
# Print pc statistics #
#######################
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
c_lvl=`printf "%.0f" $cpu`
printf "   \e[1;36m%-4s \e[0m%-5s %-25s \n" "CPU: " "$c_lvl%" `draw $c_lvl 15` 
ram=`free | awk '/Mem:/ {print int($3/$2 * 100.0)}'`
printf "   \e[1;36m%-4s \e[0m%-5s %-25s \n" "RAM: " "$ram%" `draw $ram 15` 
b_full=$battery/charge_full
b_now=$battery/charge_now
bf=`cat $b_full`
bn=`cat $b_now`
charge=`printf $(( 100 * $bn / $bf ))`
printf "   \e[1;36m%-4s \e[0m%-5s %-25s \n" "Bat: " "$charge%" `draw $charge 15 $color`
vol=`pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`
printf "   \e[1;36m%-4s \e[0m%-5s %-25s \n" "Vol: " "$vol%" `draw $vol 15 $color` 
temp=`sensors | awk '/Physical\ id\ 0/ {gsub(/\+/,"",$4); gsub(/\..+/,"",$4)    ; print $4}'`
printf "   \e[1;36m%-4s \e[0m%-5s %-25s \n" "Temp:" "$temp°c " `draw $temp 15 $color`
