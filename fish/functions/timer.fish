#!/usr/bin/fish

function timer
	#set -l sound ~/sounds/notification.wav
	set -l sound ~/sounds/pda.wav
	echo I will message you at $(date -d"$argv" +%H:%M:%S)
	sleep $(echo $(date -d"$argv" +%s) - $(date +%s) | bc)
	notify-send "Timer" "$argv"
	aplay $sound 2>/dev/null
	echo Timer done
end
