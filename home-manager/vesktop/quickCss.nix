{
	home.file.".config/vesktop/settings/quickCss.css".text = ''
@import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css");

/* No, I don't want to make a thread from a chain of more than 2 replies */
[class*="threadSuggestionBar_"] {
  display:none;
}

/* show full about me */
[style="-webkit-line-clamp: 6;"] {
  -webkit-line-clamp: 10000000 !important;
}

/* not circle */
[class^="avatar_"] {
  border-radius: 25%;
}

.userPopoutOverlayBackground-3A0Pcz {
  max-height: 60vh;
}

/* trans home icon
.childWrapper-1j_1ub{
background: url(https://raw.githubusercontent.com/teaperr/teaperhost/main/squircle.png);
background-size: contain;
visibility: hidden;
}

[aria-label='Direct Messages'].wrapper-3kah-n {
  background: url(https://raw.githubusercontent.com/teaperr/teaperhost/main/squircle.png);
  background-size: contain;
}

[class*="acronym"] {
  visibility: visible !important;
} */
/* home icon */
.wrapper-3kah-n[data-list-item-id="guildsnav___home"] .childWrapper-1j_1ub {
    background: url("https://raw.githubusercontent.com/teaperr/teaperhost/main/squircle.png") no-repeat center !important;
    background-size: cover !important;
}
.wrapper-3kah-n[data-list-item-id="guildsnav___home"] .childWrapper-1j_1ub svg {
    display: none;
}
	'';
}