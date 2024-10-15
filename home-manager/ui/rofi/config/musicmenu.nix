{
	home.file.".config/rofi/config/musicmenu.rasi".text = ''configuration {
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
		content: "test";
	  margin: 			            8px 0px 0px 8px;
	  padding: 			            8px;
	  background-color: 		        @BG;
	  text-color: 		            @FG;
	  border:                  	    0px 0px 2px 0px;
	  border-color:                   @BDR;
	  border-radius:                  10px;
}

textbox-prompt-colon {
		content: "test";
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
}
