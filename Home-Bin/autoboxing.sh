#!/usr/bin/env bash

#------------------------------------------------------------------------------
# Project Name      -
# Started On        - Sun 12 Sep 20:24:27 BST 2021
# Last Change       - Sun 12 Sep 20:56:06 BST 2021
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
# Edited By         - Bruce E. Scott
# Last Change       - Mon 13 Sep 10:56:06 EST 2021
#------------------------------------------------------------------------------
# I wrote this for my video:
#
#   https://www.youtube.com/watch?v=1Uv8KfUjRBU
#
# This basically allows you to automatically surrounding your text in pretty
# boxes, which looks especially nice with Unicode. You can change the Unicode
# characters to something else, if you'd prefer. You might like gucharmap(1).
#
# The Unicode will need a viable font. I think I use the 'fonts-opensymbol'
# package in Ubuntu-based distributions, or maybe 'fonts-symbola'.
#
# Today I added the (#) function from the video that TerminalForLife did not
# add to this script. I wanted the (#) option for the boxs... -Bruce E. Scott
#------------------------------------------------------------------------------

Title () {
    printf -v Bar '%*s' $((${#1} + 6)) ' '
    #printf '%s\n## %s ##\n%s\n' "${Bar// /#}" "$1" "${Bar// /#}"
    # Add Bar=${Bar// /#} section. Can also change thes ##\n%s\n' to this \n%s\n'
    # to have no ending (##) on the boxs right side end.
    Bar=${Bar// /#}
        printf '%s\n## %s ##\n%s\n' "$Bar" "$1" "$Bar"
}

# Title 'This is a new line of Text for box with (#)' Sample!
Title 'This is a new line of Text for box with (#)'


Title () {
    printf -v Bar '%*s' $((${#1} + 6)) ' '
    #printf '%s\n## %s ##\n%s\n' "${Bar// /#}" "$1" "${Bar// /#}"
    # Add Bar=${Bar// /#} section. Can also change thes ##\n%s\n' to this \n%s\n'
    # to have no ending (##) on the boxs right side end.
    Bar=${Bar// /#}
        printf '%s\n## %s \n%s\n' "$Bar" "$1" "$Bar"
}

# Title 'This is a new line of Text for box with (#) on the end of the box.' Sample!
Title 'This is a new line of Text for box with no (#) on the end of the box.'

Title() {
	printf -v Bar '%*s' $((${#1} + 2)) ' '
	printf '%s\n║ %s ║\n%s\n' "╔${Bar// /═}╗" "$1" "╚${Bar// /═}╝"
}

# Title 'Using Unicode for pretty Fraking boxes.' Sample!
Title 'Using Unicode for pretty Fraking boxes.'

Title() {
	printf -v Bar '%*s' $((${#1} + 2)) ' '
	printf '%s\n| %s |\n%s\n' "+${Bar// /-}+" "$1" "+${Bar// /-}+"
}

# Title 'Using ASCII for so-so boxes.' Sample!
Title 'Using ASCII for so-so boxes.'

Title() {
	# Pre-process to get the maximum length. It's not as efficient, but we're
	# still talking peanuts here, so it should be more than fine!
	MaxLen=0
	for Line in "$@"; {
		Len=${#Line}
		(( Len > MaxLen )) && MaxLen=$Len
	}

	printf -v Bar '%*s' $((MaxLen + 2)) ' '

	printf '%s\n' "/${Bar// /-}\\"
	for Line in "$@"; {
		printf '| %-*s |\n' $MaxLen "$Line"
	}
	printf '%s\n' "\\${Bar// /-}/"
}

# One argument per line; it's not as convenient as `\n`, but it suffices.
# Title 'Handling multiple lines is' 'doable in an ASCII box too,' 'with alignment.' Sample!
Title 'Handling multiple lines is' 'doable in an ASCII box too,' 'with alignment.'

Title() {
	# Similar to above's `for` loop, but interpreting a line delimiter of '|'.
	MaxLen=0
	IFS='|' read -a Lines <<< "$1"
	for Line in "${Lines[@]}"; {
		Len=${#Line}
		(( Len > MaxLen )) && MaxLen=$Len
	}

	printf -v Bar '%*s' $((MaxLen + 2)) ' '

	printf '%s\n' "╭${Bar// /─}╮"
	for Line in "${Lines[@]}"; {
		printf '│ %-*s │\n' $MaxLen "$Line"
	}
	printf '%s\n' "╰${Bar// /─}╯"
}

# As above, but instead of separate arguments, use a line delimiter of `|`.
Title 'Another Unicode example|with multiple lines using|a given delimiter.' Sample!
# Title 'Also got a new error section added for the Dependency check. |  Got this Error section from one of TerminalForLife scripts. | I like it better than joe Collins version that is commented out. | 09/05/2021 -Bruce'

Title() {
	# Similar to above's `for` loop, but interpreting a line delimiter of '|'.
	MaxLen=0
	IFS='|' read -a Lines <<< "$1"
	for Line in "${Lines[@]}"; {
		Len=${#Line}
		(( Len > MaxLen )) && MaxLen=$Len
	}

	printf -v Bar '%*s' $((MaxLen + 2)) ' '

	printf '%s\n' "#${Bar// /#}#"
	for Line in "${Lines[@]}"; {
		printf '# %-*s #\n' $MaxLen "$Line"
	}
	printf '%s\n' "#${Bar// /#}#"
}

# As above, but instead of separate arguments, use a line delimiter of `|`.
# Title 'Another Unicode example|with multiple lines using|a given delimiter.' Sample!
Title 'Another ASCII example|with multiple lines using|a given delimiter.| |Also got a new error section added for the Dependency check.|Got this Error section from one of TerminalForLife scripts.|I like it better than joe Collins version that is commented out.| 09/05/2021 -Bruce'


