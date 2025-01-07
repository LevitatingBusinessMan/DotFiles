# If running from tty1 start sway
if test (tty) = "/dev/tty1"
	# see https://github.com/flameshot-org/flameshot/blob/master/docs/Sway%20and%20wlroots%20support.md#basic-steps
	set -x SDL_VIDEODRIVER wayland,x11,windows
	set -x _JAVA_AWT_WM_NONREPARENTING 1
	set -x QT_QPA_PLATFORM wayland
	set -x XDG_CURRENT_DESKTOP sway
	set -x XDG_SESSION_DESKTOP sway

	# see https://stackoverflow.com/questions/72445825/gpg-error-inappropriate-ioctl-for-device
	set -x GPG_TTY (tty)
	exec sway > ~/.cache/sway.log
end
