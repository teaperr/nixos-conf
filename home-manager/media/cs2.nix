{
	home.file.".steam/steam/steamapps/common/Counter-Strike\ Global\ Offensive/game/csgo/cfg/autoexec.cfg".text = ''
zoom_sensitivity_ratio_mouse 0.818933

bind "2" "slot1;switchhandsright"
bind "3" "slot2;switchhandsright"
bind "4" "slot4;switchhandsright"
bind "mouse4" "slot3;switchhandsright;"

bind "]" "bot_place"
bind "F2" "noclip"

bind "j" "say Empty stomach. Balls full. Mind clear. Heart pure. This is how a man activates this animalistic instincts and spiritualize that raw power."
bind "m" "say i am going to molest you"

// increase volume while shifting
alias +incvol "incrementvar volume 0 2 0.5;+sprint";alias -incvol "incrementvar volume 0 2 -0.5;-sprint"; bind shift +incvol

// volume binds
bind [ "incrementvar volume 0 10 -0.1"; bind ] "incrementvar volume 0 10 0.1"

// flash
bind z "slot7";
// smoke
bind x "slot8";
// he
bind c "slot6";
// molly
bind v "slot10";

viewmodel_fov 68; viewmodel_offset_x 2.5; viewmodel_offset_y 0; viewmodel_offset_z -1.5; viewmodel_presetpos 2;

viewmodel_presetpos 0
viewmodel_offset_x -2
viewmodel_offset_y 2
viewmodel_offset_z -2
viewmodel_fov 68

// toggle mute team
bind "\" "toggle cl_mute_all_but_friends_and_party"

// buy binds

// full buy
bind "F5" "buy m4a1_silencer;buy ak47;buy vesthelm;buy vest;buy smokegrenade;buy defuser;buy flashbang;buy molotov;buy incgrenade;buy hegrenade;"

// half buy (cheaper rifles)
bind "6" "buy galilar;buy famas;"

// smg
bind "F6" "buy mac10;buy mp9;"

// deagle kevlar helm
bind "F7" "buy deagle;"

// awp
bind "F8" "buy awp;"

// util binds
bind "F9" "buy flashbang;"

bind "F10" "buy smokegrenade;"

bind "F11" "buy molotov;buy incgrenade"

bind "F12" "buy hegrenade;"

// armour binds
bind "=" "buy vest;"

bind "-" "buy vest;buy vesthelm;"

// kit bind
bind "7" "buy defuser;"

// refund all
bind "0" "sellbackall"

// ui stuff
cl_teammate_colors_show 2

exec moon
	'';
}
