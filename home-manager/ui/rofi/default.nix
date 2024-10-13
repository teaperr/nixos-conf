{
	home.file = {
		".config/rofi/bin/window".text = ''#!/usr/bin/env bash
rofi \
	-show window \
	-modi run,drun,ssh \
	-scroll-method 0 \
	-drun-match-fields all \
	-drun-display-format "{name}" \
	-no-drun-show-actions \
	-terminal alacritty \
	-kb-cancel Escape \
	-theme "$HOMEk/.config/rofi/config/launcher.rasi
'';
		".config/rofi/bin/launcher".text = ''#!/usr/bin/env bash
rofi \
	-show drun \
	-modi run,drun,ssh \
	-scroll-method 0 \
	-drun-match-fields all \
	-drun-display-format "{name}" \
	-no-drun-show-actions \
	-terminal alacritty \
	-kb-cancel Escape \
	-theme "$HOME"/.config/rofi/config/launcher.rasi
'';
		".config/rofi/bin/powermenu".text = ''#!/usr/bin/env bash
rofi_command="rofi -theme $HOME/.config/rofi/config/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
if [[ "$DIR" == "powermenus" ]]; then
	shutdown=""
	reboot=""
	lock=""
	suspend=""
	logout=""
	ddir="$HOME/.config/rofi/config"
else

	# Buttons
	layout=`cat $HOME/.config/rofi/config/powermenu.rasi | grep BUTTON | cut -d'=' -f2 | tr -d '[:blank:],*/'`
	if [[ "$layout" == "TRUE" ]]; then
		shutdown="󰐥"
		reboot="󰜉"
 		lock="󰍁"
 		suspend="󰒲"
 		logout="󰍃"


	else
 		shutdown="󰐥 Shutdown"
 		reboot="󰜉 Restart"
 		lock="󰍁 Lock"
 		suspend="󰒲 Sleep"
 		logout="󰍃 Logout"
	fi
	ddir="$HOME/.config/rofi/config"
fi

# Ask for confirmation
rdialog () {
rofi -dmenu\
	  -i\
	  -no-fixed-num-lines\
	  -p "Are You Sure? : "\
	  -theme "$ddir/confirm.rasi"
}

# Display Help
show_msg() {
	rofi -theme "$ddir/askpass.rasi" -e "Options : yes / no / y / n"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 0)"
case $chosen in
	  $shutdown)
		ans=$(rdialog &)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
			systemctl poweroff
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
			exit
	      else
			show_msg
	      fi
	      ;;
	  $reboot)
		ans=$(rdialog &)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
			systemctl reboot
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
			exit
	      else
			show_msg
	      fi
	      ;;
	  $lock)
	      sh $HOME/.local/bin/lock
	      ;;
	  $suspend)
		ans=$(rdialog &)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
			mpc -q pause
			amixer set Master mute
			sh $HOME/.local/bin/lock
			systemctl suspend
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
			exit
	      else
			show_msg
	      fi
	      ;;
	  $logout)
		ans=$(rdialog &)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
			openbox --exit
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
			exit
	      else
			show_msg
	      fi
	      ;;
esac

'';
		".config/rofi/bin/runner".text = ''#!/usr/bin/env bash
rofi \
	-show run \
	-scroll-method 0 \
	-terminal alacritty \
	-theme "$HOME"/.config/rofi/config/runner.rasi
'';
		".config/rofi/bin/screenshot".text = ''#!/usr/bin/env bash
rofi_command="rofi -theme $HOME/.config/rofi/config/screenshot.rasi"

time=`date +%Y-%m-%d-%I-%M-%S`
geometry=`xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current'`
dir="`xdg-user-dir PICTURES`/Screenshots"
file="Screenshot_$\{time}_$\{geometry}.png"

# Icons
icon1="$HOME/.config/dunst/icons/collections.svg"
icon2="$HOME/.config/dunst/icons/timer.svg"

# Buttons
layout=`cat $HOME/.config/rofi/config/screenshot.rasi | grep BUTTON | cut -d'=' -f2 | tr -d '[:blank:],*/'`
if [[ "$layout" == "TRUE" ]]; then
	screen="󰍹"
	area="󰆞"
	window="󰖲"
	infive="󰔝"
	inten="󰔜"
else
	screen="󰍹 Capture Desktop"
	area="󰆞 Capture Area"
	window="󰖲 Capture Window"
	infive="󰔝 Take in 3s"
	inten="󰔜 Take in 10s"
fi

# Notify and view screenshot
notify_view () {
	dunstify -u low --replace=699 -i $icon1 "Copied to clipboard."
	viewnior $\{dir}/"$file"
	if [[ -e "$dir/$file" ]]; then
		dunstify -u low --replace=699 -i $icon1 "Screenshot Saved."
	else
		dunstify -u low --replace=699 -i $icon1 "Screenshot Deleted."
	fi
}

# countdown
countdown () {
	for sec in `seq $1 -1 1`; do
		dunstify -t 1000 --replace=699 -i $icon2 "Taking shot in : $sec"
		sleep 1
	done
}

# take shots
shotnow () {
	cd $\{dir} && sleep 0.5 && maim -u -f png | tee "$file" | xclip -selection clipboard -t image/png
	notify_view
}

shot5 () {
	countdown '3'
	sleep 1 && cd $\{dir} && maim -u -f png | tee "$file" | xclip -selection clipboard -t image/png
	notify_view
}

shot10 () {
	countdown '10'
	sleep 1 && cd $\{dir} && maim -u -f png | tee "$file" | xclip -selection clipboard -t image/png
	notify_view
}

shotwin () {
	cd $\{dir} && maim -u -f png -i `xdotool getactivewindow` | tee "$file" | xclip -selection clipboard -t image/png
	notify_view
}

shotarea () {
	cd $\{dir} && maim -u -f png -s -b 2 -c 0.35,0.55,0.85,0.25 -l | tee "$file" | xclip -selection clipboard -t image/png
	notify_view
}

if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# Variable passed to rofi
options="$screen\n$area\n$window\n$infive\n$inten"

chosen="$(echo -e "$options" | $rofi_command -p 'Take Screenshot' -dmenu -selected-row 0)"
case $chosen in
	  $screen)
		shotnow
	      ;;
	  $area)
		shotarea
	      ;;
	  $window)
		shotwin
		;;
	  $infive)
		shot5
		;;
	  $inten)
		shot10
	      ;;
esac

'';

	".config/rofi/config/askpass.rasi".text = ''@import "colors.rasi"
@import "font.rasi"

* {
	  background-color:       @BG;
	  text-color:             @FG;
}

window {
	  width:        	        250px;
	  padding:    	        20px;
	  border:		            0px 0px 2px 0px;
	  border-radius:          8px;
	  border-color:           @BDR;
	  location:               0;
	  x-offset:               0;
	  y-offset:               -4%;
}

entry {
	  expand: 		        true;
	  width: 		            150px;
	  text-color:		        @BDR;
}
'';

	".config/rofi/config/bluetooth.rasi".text = ''configuration {
	  show-icons:                     false;
	  display-drun: 		            "";
	  drun-display-format:            "{icon} {name}";
	  disable-history:                false;
	  click-to-exit: 		            true;
	  location:                       0;
}

@import "font.rasi"
@import "colors.rasi"

window {
	  transparency:                   "real";
	  background-color:               @BG;
	  text-color:                     @FG;
	  border:                         2px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  width:                          300px;
	  anchor:                         center;
	  x-offset:                       0;
	  y-offset:                       0;
}

prompt {
	  enabled: 			            true;
	  margin: 			            0px 8px 0px 8px;
	  padding: 			            8px;
	  background-color: 	            @IMG;
	  text-color: 	                @BG;
	  border:                  	    0px 0px 0px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
}

textbox-prompt-colon {
	  expand: 			            false;
	  str: 			                "󰂯";
	  border-radius:                  100%;
	  background-color:               @SEL;
	  text-color:                     @FG;
	  padding:                        8px 12px 8px 12px;
	  font:			                "HackGen Console NF Regular 10";
}

entry {
	  background-color:               @BG;
	  text-color:                     @FG;
	  placeholder-color:              @FG;
	  expand:                         true;
	  horizontal-align:               0;
	  placeholder:                    "";
	  blink:                          true;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  padding:                        8px;
}

inputbar {
	  children: 		                [ textbox-prompt-colon, prompt, entry ];
	  background-color:               @BG;
	  text-color:                     @FG;
	  expand:                         false;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  0px;
	  border-color:                   @BDR;
	  margin:                         0px 0px 0px 0px;
	  padding:                        0px;
	  position:                       center;
}

case-indicator {
	  background-color:               @BG;
	  text-color:                     @FG;
	  spacing:                        0;
}


listview {
	  background-color:               @BG;
	  columns:                        1;
	  lines:			    7;
	  spacing:                        4px;
	  cycle:                          true;
	  dynamic:                        true;
	  layout:                         vertical;
}

mainbox {
	  background-color:               @BG;
	  children:                       [ inputbar, listview ];
	  spacing:                       	15px;
	  padding:                        15px;
}

element {
	  background-color:               @BG;
	  text-color:                     @FG;
	  orientation:                    horizontal;
	  border-radius:                  4px;
	  padding:                        6px 6px 6px 6px;
}

element-icon {
	  background-color: 				inherit;
	  text-color:       				inherit;
	  size:                           0px;
	  border:                         0px;
}

element-text {
	  background-color: 				inherit;
	  text-color:       				inherit;
	  expand:                         true;
	  horizontal-align:               0;
	  vertical-align:                 0.5;
	  margin:                         2px 0px 2px 6px;
}

element normal.urgent,
element alternate.urgent {
	  background-color:               @UGT;
	  text-color:                     @FG;
	  border-radius:                  9px;
}

element normal.active,
element alternate.active {
	  background-color:               @BGA;
	  text-color:                     @FG;
}

element selected {
	  background-color:               @BGA;
	  text-color:                     @SEL;
	  border:                  		0px 0px 0px 0px;
	  border-radius:                  10px;
	  border-color:                  	@BDR;
}

element selected.urgent {
	  background-color:               @UGT;
	  text-color:                     @FG;
}

element selected.active {
	  background-color:               @BGA;
	  color:                          @FG;
}
'';

	".config/rofi/config/colors.rasi".text = ''* {
	  BG:     #1E1D2Fff;     /* Background color */
	  BGA:    #B7BDF8ff;     /* Background accent (Lavender) */
	  FG:     #D9E0EEff;     /* Foreground color */
	  FGA:    #C9CBFFff;     /* Foreground accent (Lavender) */
	  BDR:    #B7BDF8ff;     /* Border color (Lavender) */
	  SEL:    #1E1E2Eff;     /* Selection color */
	  UGT:    #B7BDF8ff;     /* Underline text (Lavender) */
	  IMG:    #B7BDF8ff;     /* Image color (Lavender) */
	  OFF:    #575268ff;     /* Off color (disabled state) */
	  ON:     #B7BDF8ff;     /* On color (active state, Lavender) */
}
'';

	".config/rofi/config/confirm.rasi".text = ''@import "colors.rasi"
@import "font.rasi"

* {
	  background-color:       @BG;
	  text-color:             @FG;
}

window {
	  width:      	        200px;
	  padding:                20px;
	  border:		            0px 0px 2px 0px;
	  border-radius:          8px;
	  border-color:           @BDR;
	  location:               0;
	  x-offset:               0;
	  y-offset:               -4%;
}

entry {
	  expand: 		        true;
	  width: 		            150px;
	  text-color:		        @BDR;
}
'';

	".config/rofi/config/font.rasi".text = ''* {
	  font:				 	"HackGen Console NF Regular 10";
}
'';

	".config/rofi/config/launcher.rasi".text = ''configuration {
	  show-icons:                     true;
	  display-drun: 		            "";
	  drun-display-format:            "{icon} {name}";
	  disable-history:                false;
	  click-to-exit: 		            true;
	  location:                       0;
}

@import "font.rasi"
@import "colors.rasi"

window {
	  transparency:                   "real";
	  background-color:               @BG;
	  text-color:                     @FG;
	  border:                         2px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  width:                          500px;
	  anchor:                         center;
	  x-offset:                       0;
	  y-offset:                       0;
}

prompt {
	  enabled: 			            true;
	  padding: 			            8px;
	  background-color: 		        @BG;
	  text-color: 		            @IMG;
}

textbox-prompt-colon {
	  expand: 			            false;
	  str: 			                "";
	  border-radius:                  100%;
	  background-color:               @SEL;
	  text-color:                     @FG;
	  padding:                        8px 12px 8px 12px;
	  font:			                "HackGen Console NF Regular 10";
}

entry {
	  background-color:               @BG;
	  text-color:                     @FG;
	  placeholder-color:              @FG;
	  expand:                         true;
	  horizontal-align:               0;
	  placeholder:                    "Search...";
	  blink:                          true;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  padding:                        8px;
}

inputbar {
	children: 			              [ textbox-prompt-colon, prompt, entry ];
	  background-color:               @BG;
	  text-color:                     @FG;
	  expand:                         false;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  0px;
	  border-color:                   @BDR;
	  margin:                         0px 0px 0px 0px;
	  padding:                        0px;
	  position:                       center;
}

case-indicator {
	  background-color:               @BG;
	  text-color:                     @FG;
	  spacing:                        0;
}


listview {
	  background-color:               @BG;
	  columns:                        1;
	  lines:			                7;
	  spacing:                        4px;
	  cycle:                          false;
	  dynamic:                        true;
	  layout:                         vertical;
}

mainbox {
	  background-color:               @BG;
	  children:                       [ inputbar, listview ];
	  spacing:                        15px;
	  padding:                        15px;
}

element {
	  background-color:               @BG;
	  text-color:                     @FG;
	  orientation:                    horizontal;
	  border-radius:                  4px;
	  padding:                        6px 6px 6px 6px;
}

element-icon {
	  background-color: 	            inherit;
	  text-color:       		        inherit;
	  horizontal-align:               0.5;
	  vertical-align:                 0.5;
	  size:                           24px;
	  border:                         0px;
}

element-text {
	  background-color: 		        inherit;
	  text-color:       		        inherit;
	  expand:                         true;
	  horizontal-align:               0;
	  vertical-align:                 0.5;
	  margin:                         2px 0px 2px 2px;
}

element normal.urgent,
element alternate.urgent {
	  background-color:               @UGT;
	  text-color:                     @FG;
	  border-radius:                  9px;
}

element normal.active,
element alternate.active {
	  background-color:               @BGA;
	  text-color:                     @FG;
}

element selected {
	  background-color:               @BGA;
	  text-color:                     @SEL;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  10px;
	  border-color:                   @BDR;
}

element selected.urgent {
	  background-color:               @UGT;
	  text-color:                     @FG;
}

element selected.active {
	  background-color:               @BGA;
	  color:                          @FG;
}
'';

	".config/rofi/config/mpd.rasi".text = ''configuration {
	  show-icons:                     false;
	  display-drun: 		            "";
	  drun-display-format:            "{icon} {name}";
	  disable-history:                false;
	  click-to-exit: 		            true;
	  location:                       0;
}

@import "font.rasi"
@import "colors.rasi"

/* Line Responsible For Button Layouts */
/* BUTTON = FALSE */

window {
	  transparency:                   "real";
	  background-color:               @BG;
	  text-color:                     @FG;
	  border:                         2px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  width:                          400px;
	  anchor:                         center;
	  x-offset:                       0;
	  y-offset:                       0;
}

prompt {
	  enabled: 			            true;
	  margin: 			            0px 0px 0px 8px;
	  padding: 			            8px;
	  background-color: 		        @BG;
	  text-color: 		            @FG;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
}

textbox-prompt-colon {
	  expand: 			            false;
	  str: 			                "󰝚";
	  border-radius:                  100%;
	  background-color:               @BG;
	  text-color:                     @FG;
	  padding:                        8px 12px 8px 12px;
	  font:			                "HackGen Console NF Regular 10";
}

entry {
	  background-color:               @BG;
	  text-color:                     @FG;
	  placeholder-color:              @FG;
	  expand:                         true;
	  horizontal-align:               0;
	  placeholder:                    "Search...";
	  blink:                          true;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  padding:                        8px;
}

inputbar {
	  children: 			            [ textbox-prompt-colon, prompt ];
	  background-color:               @BG;
	  text-color:                     @FG;
	  expand:                         false;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  0px;
	  border-color:                   @BDR;
	  margin:                         0px 0px 0px 0px;
	  padding:                        0px;
	  position:                       center;
}

case-indicator {
	  background-color:               @BG;
	  text-color:                     @FG;
	  spacing:                        0;
}


listview {
	  background-color:               @BG;
	  columns:                        3;
	  lines:			                2;
	  spacing:                        15px;
	  cycle:                          false;
	  dynamic:                        true;
	  layout:                         vertical;
}

mainbox {
	  background-color:               @BG;
	  children:                       [ inputbar, listview ];
	  spacing:                        15px;
	  padding:                        15px;
}

element {
	  background-color:               @BGA;
	  text-color:                     @SEL;
	  orientation:                    horizontal;
	  border-radius:                  10px;
	  padding:                        8px;
}

element-icon {
	  background-color: 		        inherit;
	  text-color:       		        inherit;
	  size:                           0px;
	  border:                         0px;
}

element-text {
	  background-color: 		        inherit;
	  text-color:       		        inherit;
	  expand:                         true;
	  horizontal-align:               0.5;
	  vertical-align:                 0.5;
	  margin:                         2px 0px 0px 0px;
}

element selected {
	  background-color:               @IMG;
	  text-color:                     @BG;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  10px;
	  border-color:                   @BDR;
}

element.active,
element.selected.urgent {
	background-color: @ON;
	text-color: @BG;
	border-color: @ON;
}

element.selected.urgent {
	border-color: @BDR;
}

element.urgent,
element.selected.active {
	background-color: @OFF;
	text-color: @BG;
	border-color: @OFF;
}

element.selected.active {
	border-color: @BDR;
}
'';

	".config/rofi/config/networkmenu.rasi".text = ''configuration {
	  show-icons:                     false;
	  display-drun: 		            "";
	  drun-display-format:            "{icon} {name}";
	  disable-history:                false;
	  click-to-exit: 		            true;
	  location:                       0;
}

@import "font.rasi"

window {
	  transparency:                   "real";
	  background-color:               @BG;
	  text-color:                     @FG;
	  border:                         2px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  width:                          400px;
	  anchor:                         center;
	  x-offset:                       0;
	  y-offset:                       0;
}

prompt {
	  enabled: 			            true;
	  margin: 			            0px 8px 0px 8px;
	  padding: 			            8px;
	  background-color: 		        @IMG;
	  text-color: 		            @BG;
	  border:                  	    0px 0px 0px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
}

textbox-prompt-colon {
	  expand: 			            false;
	  str: 			                "󰖩";
	  border-radius:                  100%;
	  background-color:               @SEL;
	  text-color:                     @FG;
	  padding:                        8px 12px 8px 12px;
	  font:			                "HackGen Console NF Regular 10";
}

entry {
	  background-color:               @BG;
	  text-color:                     @FG;
	  placeholder-color:              @FG;
	  expand:                         true;
	  horizontal-align:               0;
	  placeholder:                    "";
	  blink:                          true;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  padding:                        8px;
}

inputbar {
	  children: 		                [ textbox-prompt-colon, prompt, entry ];
	  background-color:               @BG;
	  text-color:                     @FG;
	  expand:                         false;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  0px;
	  border-color:                   @BDR;
	  margin:                         0px 0px 0px 0px;
	  padding:                        0px;
	  position:                       center;
}

case-indicator {
	  background-color:               @BG;
	  text-color:                     @FG;
	  spacing:                        0;
}


listview {
	  background-color:               @BG;
	  columns:                        1;
	  lines:			                7;
	  spacing:                        4px;
	  cycle:                          true;
	  dynamic:                        true;
	  layout:                         vertical;
}

mainbox {
	  background-color:               @BG;
	  children:                       [ inputbar, listview ];
	  spacing:                        15px;
	  padding:                        15px;
}

element {
	  background-color:               @BG;
	  text-color:                     @FG;
	  orientation:                    horizontal;
	  border-radius:                  4px;
	  padding:                        6px 6px 6px 6px;
}

element-icon {
	  background-color: 	            inherit;
	  text-color:       		        inherit;
	  size:                           0px;
	  border:                         0px;
}

element-text {
	  background-color: 	            inherit;
	  text-color:       		        inherit;
	  expand:                         true;
	  horizontal-align:               0;
	  vertical-align:                 0.5;
	  margin:                         2px 0px 2px 6px;
}

element normal.urgent,
element alternate.urgent {
	  background-color:               @UGT;
	  text-color:                     @FG;
	  border-radius:                  9px;
}

element normal.active,
element alternate.active {
	  background-color:               @BGA;
	  text-color:                     @FG;
}

element selected {
	  background-color:               @BGA;
	  text-color:                     @SEL;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  10px;
	  border-color:                   @BDR;
}

element selected.urgent {
	  background-color:               @UGT;
	  text-color:                     @FG;
}

element selected.active {
	  background-color:               @BGA;
	  color:                          @FG;
}
'';

	".config/rofi/config/network.rasi".text = ''configuration {
	  show-icons:                     false;
	  display-drun: 		            "";
	  drun-display-format:            "{icon} {name}";
	  disable-history:                false;
	  click-to-exit: 		            true;
	  location:                       0;
}

@import "font.rasi"
@import "colors.rasi"

window {
	  transparency:                   "real";
	  background-color:               @BG;
	  text-color:                     @FG;
	  border:                         2px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  width:                          300px;
	  anchor:                         center;
	  x-offset:                       0;
	  y-offset:                       0;
}

prompt {
	  enabled: 			            true;
	  margin: 			            0px 0px 0px 8px;
	  padding: 			            8px;
	  background-color: 		        @BG;
	  text-color: 		            @FG;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
}

textbox-prompt-colon {
	  expand: 			            false;
	  str: 			                "";
	  border-radius:                  100%;
	  background-color:               @BG;
	  text-color:                     @FG;
	  padding:                        8px 12px 8px 12px;
	  font:			                "HackGen Console NF Regular 10";
}

entry {
	  background-color:               @BG;
	  text-color:                     @FG;
	  placeholder-color:              @FG;
	  expand:                         true;
	  horizontal-align:               0;
	  placeholder:                    "Search...";
	  blink:                          true;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  padding:                        8px;
}

inputbar {
	  children: 			             [textbox-prompt-colon, prompt ];
	  background-color:               @BG;
	  text-color:                     @FG;
	  expand:                         false;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  0px;
	  border-color:                   @BDR;
	  margin:                         0px 0px 0px 0px;
	  padding:                        0px;
	  position:                       center;
}

case-indicator {
	  background-color:               @BG;
	  text-color:                     @FG;
	  spacing:                        0;
}


listview {
	  background-color:               @BG;
	  columns:                        1;
	  lines:			                4;
	  spacing:                        4px;
	  cycle:                          true;
	  dynamic:                        true;
	  layout:                         vertical;
}

mainbox {
	  background-color:               @BG;
	  children:                       [ inputbar, listview ];
	  spacing:                        15px;
	  padding:                        15px;
}

element {
	  background-color:               @BG;
	  text-color:                     @FG;
	  orientation:                    horizontal;
	  border-radius:                  10px;
	  padding:                        6px 6px 6px 6px;
}

element-icon {
	  background-color: 		        inherit;
	  text-color:       		        inherit;
	  size:                           0px;
	  border:                         0px;
}

element-text {
	  background-color: 		        inherit;
	  text-color:       		        inherit;
	  expand:                         true;
	  horizontal-align:               0;
	  vertical-align:                 0.5;
	  margin:                         2px 0px 2px 6px;
}

element selected {
	  background-color:               @IMG;
	  text-color:                     @BG;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  10px;
	  border-color:                   @BDR;
}

element.active,
element.selected.urgent {
	background-color: @ON;
	text-color: @BG;
	border-color: @ON;
}

element.selected.urgent {
	border-color: @BDR;
}

element.urgent,
element.selected.active {
	background-color: @OFF;
	text-color: @BG;
	border-color: @OFF;
}

element.selected.active {
	border-color: @BDR;
}
'';

	".config/rofi/config/powermenu.rasi".text = ''configuration {
	  show-icons:                     true;
	  display-drun: 		            "";
	  drun-display-format:            "{icon} {name}";
	  disable-history:                false;
	  click-to-exit: 		            true;
	  location:                       4;
}

@import "font.rasi"
@import "colors.rasi"

/* Line Responsible For Button Layouts */
/* BUTTON = TRUE */

window {
	  transparency:                   "real";
	  background-color:               @BG;
	  text-color:                     @FG;
	  border:                  	    2px;
	  border-color:                   @BGA;
	  border-radius:                  10px;
	  width:                          110px;
	  x-offset:                       -1%;
	  y-offset:                       0;
}

prompt {
	  enabled: 			            true;
	  margin: 			            0px 0px 0px 8px;
	  padding: 			            8px;
	  background-color: 		        @BG;
	  text-color: 		            @FG;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
}

textbox-prompt-colon {
	  expand: 			            false;
	  str: 			                "";
	  border-radius:                  100%;
	  background-color:               @BG;
	  text-color:                     @BG;
	  padding:                        8px 12px 8px 12px;
	  font:			                "HackGen Console NF Regular 10";
}

entry {
	  background-color:               @BG;
	  text-color:                     @FG;
	  placeholder-color:              @FG;
	  expand:                         true;
	  horizontal-align:               0;
	  placeholder:                    "Search...";
	  blink:                          true;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  padding:                        8px;
}

inputbar {
	  children: 		                [ textbox-prompt-colon ];
	  background-color:               @BG;
	  text-color:                     @FG;
	  expand:                         false;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  0px;
	  border-color:                   @BDR;
	  margin:                         0px 0px 0px 0px;
	  padding:                        0px;
	  position:                       center;
}

case-indicator {
	  background-color:               @BG;
	  text-color:                     @FG;
	  spacing:                        0;
}


listview {
	  background-color:               @BG;
	  columns:                        1;
	  lines:			                5;
	  spacing:                        15px;
	  cycle:                          true;
	  dynamic:                        true;
	  layout:                         vertical;
}

mainbox {
	  background-color:               @BG;
	  children:                       [ listview ];
	  spacing:                        15px;
	  padding:                        15px;
}

element {
	  background-color:               @BG;
	  text-color:                     @FG;
	  orientation:                    horizontal;
	  border-radius:                  10px;
	  padding:                        20px;
}

element-icon {
	  background-color: 		        inherit;
	  text-color:       		        inherit;
	  horizontal-align:               0.5;
	  vertical-align:                 0.5;
	  size:                           0px;
	  border:                         0px;
}

element-text {
	  background-color: 		        inherit;
	  text-color:       		        inherit;
	  font:			                "feather 20";
	  expand:                         true;
	  horizontal-align:               0.5;
	  vertical-align:                 0.5;
	  margin:                         0px 0px 0px 0px;
}

element selected {
	  background-color:               @BGA;
	  text-color:                     @SEL;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  10px;
	  border-color:                   @BDR;
}

element.active,
element.selected.urgent {
	background-color: @ON;
	text-color: @BG;
	border-color: @ON;
}

element.selected.urgent {
	border-color: @BDR;
}

element.urgent,
element.selected.active {
	background-color: @OFF;
	text-color: @BG;
	border-color: @OFF;
}

element.selected.active {
	border-color: @BDR;
}
'';

	".config/rofi/config/runner.rasi".text = ''configuration {
	  show-icons:                     false;
	  display-run: 		            "";
	  disable-history:                false;
	  click-to-exit: 		            true;
	  location:                       0;
}

@import "font.rasi"
@import "colors.rasi"

window {
	  transparency:                   "real";
	  background-color:               @BG;
	  text-color:                     @FG;
	  border:                         2px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  width:                          350px;
	  location:                       center;
	  anchor:                         center;
	  x-offset:                       0;
	  y-offset:                       0;
}

prompt {
	  enabled: 			            true;
	  padding: 			            8px;
	  background-color: 		        @BG;
	  text-color: 		            @IMG;
}

textbox-prompt-colon {
	  expand: 			            false;
	  str: 			                "󰞷";
	  border-radius:                  100%;
	  background-color:               @BG;
	  text-color:                     @FG;
	  padding:                        8px 12px 8px 12px;
	font:							"HackGen Console NF Regular 10";
}

entry {
	  background-color:               @BG;
	  text-color:                     @FG;
	  placeholder-color:              @FG;
	  expand:                         true;
	  horizontal-align:               0;
	  placeholder:                    "Run...";
	  blink:                          true;
	  border:                  		0px 0px 2px 0px;
	  border-color:                  	@BDR;
	  border-radius:                  10px;
	  padding:                        8px;
}

inputbar {
	children: 						[ textbox-prompt-colon, prompt, entry ];
	  background-color:               @BG;
	  text-color:                     @FG;
	  expand:                         false;
	  border:                  		0px 0px 0px 0px;
	  border-radius:                  0px;
	  border-color:                  	@BDR;
	  margin:                         0px 0px 0px 0px;
	  padding:                        0px;
	  position:                       center;
}

case-indicator {
	  background-color:               @BG;
	  text-color:                     @FG;
	  spacing:                        0;
}


listview {
	  background-color:               @BG;
	  columns:                        1;
	  lines:							5;
	  spacing:                        4px;
	  cycle:                          false;
	  dynamic:                        true;
	  layout:                         vertical;
}

mainbox {
	  background-color:               @BG;
	  children:                       [ inputbar, listview ];
	  spacing:                       	15px;
	  padding:                        15px;
}

element {
	  background-color:               @BG;
	  text-color:                     @FG;
	  orientation:                    horizontal;
	  border-radius:                  4px;
	  padding:                        6px 6px 6px 6px;
}

element-icon {
	  background-color: 				inherit;
	  text-color:       				inherit;
	  size:                           0px;
	  border:                         0px;
}

element-text {
	  background-color: 				inherit;
	  text-color:       				inherit;
	  expand:                         true;
	  horizontal-align:               0;
	  vertical-align:                 0.5;
	  margin:                         2px 0px 2px 2px;
}

element normal.urgent,
element alternate.urgent {
	  background-color:               @UGT;
	  text-color:                     @FG;
	  border-radius:                  9px;
}

element normal.active,
element alternate.active {
	  background-color:               @BGA;
	  text-color:                     @FG;
}

element selected {
	  background-color:               @BGA;
	  text-color:                     @SEL;
	  border:                  		0px 0px 0px 0px;
	  border-radius:                  10px;
	  border-color:                  	@BDR;
}

element selected.urgent {
	  background-color:               @UGT;
	  text-color:                     @FG;
}

element selected.active {
	  background-color:               @BGA;
	  color:                          @FG;
}
'';

	".config/rofi/config/screenshot.rasi".text = ''configuration {
	  show-icons:                     false;
	  display-drun: 		            "";
	  drun-display-format:            "{icon} {name}";
	  disable-history:                false;
	  click-to-exit: 		            true;
	  location:                       0;
}

@import "font.rasi"
@import "colors.rasi"

/* Line Responsible For Button Layouts */
/* BUTTON = FALSE */

window {
	  transparency:                   "real";
	  background-color:               @BG;
	  text-color:                     @FG;
	  border:                         2px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  width:                          300px;
	  anchor:                         center;
	  x-offset:                       0;
	  y-offset:                       0;
}

prompt {
	  enabled: 			            true;
	  margin: 			            0px 0px 0px 8px;
	  padding: 			            8px;
	  background-color: 		        @BG;
	  text-color: 		            @FG;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
}

textbox-prompt-colon {
	  expand: 			            false;
	  str: 			                "󰄀";
	  border-radius:                  100%;
	  background-color:               @BG;
	  text-color:                     @FG;
	  padding:                        8px 12px 8px 12px;
	  font:			                "HackGen Console NF Regular 10";
}

entry {
	  background-color:               @BG;
	  text-color:                     @FG;
	  placeholder-color:              @FG;
	  expand:                         true;
	  horizontal-align:               0;
	  placeholder:                    "Search...";
	  blink:                          true;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
	  padding:                        8px;
}

inputbar {
	children: 						[ textbox-prompt-colon, prompt ];
	  background-color:               @BG;
	  text-color:                     @FG;
	  expand:                         false;
	  border:                  		0px 0px 0px 0px;
	  border-radius:                  0px;
	  border-color:                  	@BDR;
	  margin:                         0px 0px 0px 0px;
	  padding:                        0px;
	  position:                       center;
}

case-indicator {
	  background-color:               @BG;
	  text-color:                     @FG;
	  spacing:                        0;
}


listview {
	  background-color:               @BG;
	  columns:                        1;
	  lines:							5;
	  spacing:                        4px;
	  cycle:                          true;
	  dynamic:                        true;
	  layout:                         vertical;
}

mainbox {
	  background-color:               @BG;
	  children:                       [ inputbar, listview ];
	  spacing:                       	15px;
	  padding:                        15px;
}

element {
	  background-color:               @BG;
	  text-color:                     @FG;
	  orientation:                    horizontal;
	  border-radius:                  10px;
	  padding:                        6px 6px 6px 6px;
}

element-icon {
	  background-color: 				inherit;
	  text-color:       				inherit;
	  size:                           0px;
	  border:                         0px;
}

element-text {
	  background-color: 				inherit;
	  text-color:       				inherit;
	  expand:                         true;
	  horizontal-align:               0;
	  vertical-align:                 0.5;
	  margin:                         2px 0px 2px 6px;
}

element selected {
	  background-color:               @BGA;
	  text-color:                     @SEL;
	  border:                  		0px 0px 0px 0px;
	  border-radius:                  10px;
	  border-color:                  	@BDR;
}

element.active,
element.selected.urgent {
	background-color: @ON;
	text-color: @BG;
	border-color: @ON;
}

element.selected.urgent {
	border-color: @BDR;
}

element.urgent,
element.selected.active {
	background-color: @OFF;
	text-color: @BG;
	border-color: @OFF;
}

element.selected.active {
	border-color: @BDR;
}
'';
		".local/bin/lock".text = ''betterlockscreen -l --span
betterlockscreen -u /home/lotus/nixos-conf/home-manager/common/assets/wallpaper.jpg &
		'';
		".config/rofi/config.rasi".text = '' configuration {
	kb-row-up: "Up,Control+k,Shift+Tab,Shift+ISO_Left_Tab";
	kb-row-down: "Down,Control+j";
	kb-accept-entry: "Control+m,Return,KP_Enter";
	terminal: "mate-terminal";
	kb-remove-to-eol: "Control+Shift+e";
	/*kb-mode-next: "Shift+Right,Control+Tab,Control+l";*/
	kb-mode-previous: "Shift+Left,Control+Shift+Tab,Control+h";
	kb-remove-char-back: "BackSpace";
}
'';


		".config/rofi/bin/musicmenu".text = ''#!/usr/bin/env bash
rofi_command="rofi -theme $HOME/.config/rofi/config/musicmenu.rasi -no-click-to-exit"

# Define the buttons (icons)
previous="󰒮"
playpause="󰐎"
next="󰒭"

# Variable passed to rofi
options="$previous\n$playpause\n$next"

echo $options

while true; do
  chosen="$(echo -e "$options" | $rofi_command -p "Music Controls" -dmenu -selected-column 2)"
	echo $chosen
  case $chosen in
	$previous)
		rmpc prev
		;;
	$playpause)
		rmpc togglepause
		;;
	$next)
		rmpc next
		;;
	*)
		break
		;;
  esac
done

'';

	".config/rofi/config/musicmenu.rasi".text = ''configuration {
	  show-icons:                     true;
	  display-drun: 		            "";
	  drun-display-format:            "{icon} {name}";
	  disable-history:                false;
	  click-to-exit: 		            true;
	  location:                       0;
}

@import "font.rasi"
@import "colors.rasi"

window {
	  transparency:                   "real";
	  background-color:               @BG;
	  text-color:                     @FG;
	  border:                  	    2px;
	  border-color:                   @BGA;
	  border-radius:                  10px;
	  width:                          400px;
	  x-offset:                       0;
	  y-offset:                       0;
}

prompt {
	  enabled: 			            true;
	  margin: 			            0px 0px 0px 8px;
	  padding: 			            8px;
	  background-color: 		        @BG;
	  text-color: 		            @FG;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
}

textbox-prompt-colon {
	  expand: 			            false;
	  str: 			                "";
	  border-radius:                  100%;
	  background-color:               @BG;
	  text-color:                     @BG;
	  padding:                        8px 12px 8px 12px;
	  font:			                "HackGen Console NF Regular 10";
}

case-indicator {
	  background-color:               @BG;
	  text-color:                     @FG;
	  spacing:                        10;
}

listview {
	  background-color: @BG;
	  columns: 3;
	  lines: 1;
	  spacing: 10px;
	  cycle: true;
	  dynamic: true;
}


mainbox {
	  background-color:               @BG;
	  children:                       [ listview ];
	  spacing:                        15px;
	  padding:                        15px;
}

element {
	  background-color:               @BG;
	  text-color:                     @FG;
	  orientation:                    horizontal;
	  border-radius:                  10px;
	  padding:                        20px;
}

element-icon {
	  background-color: 		        inherit;
	  text-color:       		        inherit;
	  horizontal-align:               0.5;
	  vertical-align:                 0.5;
	  size:                           0px;
	  border:                         0px;
}

element-text {
	  background-color: 		        inherit;
	  text-color:       		        inherit;
	  font:			                "HackGen Console NF Regular 20";
	  expand:                         true;
	  horizontal-align:               0.5;
	  vertical-align:                 0.5;
	  margin:                         0px 0px 0px 0px;
}

element selected {
	  background-color:               @BGA;
	  text-color:                     @SEL;
	  border:                  	    0px 0px 0px 0px;
	  border-radius:                  10px;
	  border-color:                   @BDR;
}

element.active,
element.selected.urgent {
	background-color: @ON;
	text-color: @BG;
	border-color: @ON;
}

element.selected.urgent {
	border-color: @BDR;
}

element.urgent,
element.selected.active {
	background-color: @OFF;
	text-color: @BG;
	border-color: @OFF;
}

element.selected.active {
	border-color: @BDR;
}
'';
	};
}
