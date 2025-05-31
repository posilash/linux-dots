#!/bin/sh

handle() {
  case $1 in
    *firefox*Extension:*)
      floating=$(hyprctl clients | grep -m 1 "Extension:" -A 10 | grep -m 1 floating | awk '{print $2}')
      if [[ $floating -eq 0 ]]; then
          hyprctl dispatch togglefloating
	  hyprctl dispatch resizeactive exact 379 563
	  hyprctl dispatch moveactive exact 1650 141
      fi
      ;;
    *Picture-in-Picture*)
      float=$(hyprctl clients | grep -m 1 "Picture-in-Picture" -A 10 | grep -m 1 floating | awk '{print $2}')
      if [[ $float -eq 0 ]]; then 
	  hyprctl dispatch togglefloating
      fi
      pin=$(hyprctl clients | grep -m 1 "Picture-in-Picture" -A 20 | grep -m 1 pinned | awk '{print $2}')
      if [[ $pin -eq 0 ]]; then
	  hyprctl dispatch pin active
	  hyprctl dispatch resizeactive exact 875 572
          hyprctl dispatch moveactive exact 1671 854
      fi
      ;;
    *Picture\ in\ picture*)
      float=$(hyprctl clients | grep -m 1 "Picture in picture" -A 10 | grep -m 1 floating | awk '{print $2}')
      if [[ $float -eq 0 ]]; then 
	  hyprctl dispatch togglefloating
	  #hyprctl dispatch pin active
	  hyprctl dispatch resizeactive exact 875 572
	  hyprctl dispatch centerwindow
          #hyprctl dispatch moveactive exact 1671 854
      fi
      ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; 
do handle "$line"; done > /dev/null 2>&1 &
