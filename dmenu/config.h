/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
static int centered = 0;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                    /* minimum width when centered */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
// gruvbox
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#D8DEE9", "#2E3440" },
	[SchemeSel] = { "#ECEFF4", "#434C5E" },
	[SchemeSelHighlight] = { "#5E81AC", "#434C5E" },
	[SchemeNormHighlight] = { "#88C0D0", "#2E3440" },
	[SchemeOut] = { "#ff5555", "#00ffff" }, // Xiaowen: I'm not sure what this for
};
static const unsigned int border_width = 5;


/* static const char *colors[SchemeLast][2] = { */
/* 	/1*     fg         bg       *1/ */
/* 	[SchemeNorm] = { "#a89984", "#282828" }, */
/* 	[SchemeSel] = { "#a89984", "#3c3836" }, */
/* 	[SchemeSelHighlight] = { "#d79921", "#3c3836" }, */
/* 	[SchemeNormHighlight] = { "#d79921", "#282828" }, */
/* 	[SchemeOut] = { "#ff5555", "#00ffff" }, // Xiaowen: I'm not sure what this for */
/* }; */

// draula theme
/* static const char *colors[SchemeLast][2] = { */
/* 	/1*     fg         bg       *1/ */
/* 	[SchemeNorm] = { "#f8f8f2", "#282a36" }, */
/* 	[SchemeSel] = { "#f8f8f2", "#44475a" }, */
/* 	[SchemeSelHighlight] = { "#ff79c6", "#44475a" }, */
/* 	[SchemeNormHighlight] = { "#ff79c6", "#282a36" }, */
/* 	[SchemeOut] = { "#ff5555", "#00ffff" },
/* }; */
/* static const unsigned int border_width = 5; */

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
static unsigned int lineheight = 0;         /* -h option; minimum height of a menu line     */

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

