[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#synclient TapButton1=1
#synclient TapButton2=2
#synclient TapButton3=3
#rofi -key-window F12 -key-run F2 &
#sudo mount /dev/sdb2 /mnt/VMs
#sudo mount -t ntfs-3g -o umask=000 /dev/sdb4 /mnt/files
setxkbmap us -option caps:escape
#xinput set-button-map 16 3 2 1
#xinput set-button-map 17 3 2 1
# get the mouse id from xinput list
# 3 2 1 inverts mouse buttons
cd ~/projects/desktrack/
bash start.sh &
cd ~/
xrandr --output DP-0 --auto
# xrandr --output HDMI-0 --auto --output DP-0 --rotate left --auto --left-of HDMI-0
xrandr --output DP-0 --auto --output DP-2 --rotate left --auto --left-of DP-0
#~/./xflux -z 45070
i3
