#!/usr/bin/env bash
#cito M:755 O:0 G:0 T:/usr/bin/mif
#------------------------------------------------------------------------------
# Project Name      - Extra/source/mif (Movie Index Filter)
# Started On        - Fri 13 Oct 13:21:13 BST 2017
# Last Change       - Mon 23 Nov 20:01:37 GMT 2020
# Author E-Mail     - terminalforlife@yahoo.com
# Author GitHub     - https://github.com/terminalforlife
#------------------------------------------------------------------------------

CurVer='2020-11-23'
Progrm=${0##*/}

Usage(){
	while read; do
		printf '%s\n' "$REPLY"
	done <<-EOF
		Usage: $Progrm [OPTS] [YEAR]

		  -h, --help               - Displays this help information.
		  -v, --version            - Output only the version datestamp.
		  --mklist[:+/-]           - Output a $Progrm-usable list from CWD.
		  -O, --organize           - Attempt to organise files in CWD by year.
		  -a, --all                - Display films; disregard filters.
		  -f, --file [FILE]        - Override saved path with FILE.
		  -s, --seen               - Filter by movies marked as seen.
		  -t, --total              - Output total number of matches.
		  -u, --unseen             - Default. Works opposite to above.

		  The file which $Progrm parses must be in a strict layout in order for
		  $Progrm to work correctly. An example of such a file's contents:

		    # Comment lines will be ignored.
		    1972[+]: The Godfather
		    1992[+]: Alien 3
		    1994[+]: Clear and Present Danger
		    1994[+]: Jack Dee: Live at the London Palladium

		  Default index file is '~/.$Progrm', but can be easily overridden.
	EOF
}

Err(){
	printf 'ERROR: %s\n' "$2" 1>&2
	[ $1 -gt 0 ] && exit $1
}

if [ "${BASH_VERSINFO[0]}" -ge 4 ]; then
	shopt -s extglob globstar
else
	Err 1 "Bash version 4.0 or greater is required."
fi

MovieIndex="$HOME/.$Progrm"
Seen='false'
Total='false'

while [ "$1" ]; do
	case $1 in
		--help|-h|-\?)
			Usage; exit 0 ;;
		--version|-v)
			printf "%s\n" "$CurVer"; exit 0 ;;
		--mklist|-M)
			shift; MAKE_LIST_OPT=':[+]' ;;
		--mklist:N|-M:N)
			shift; MAKE_LIST_OPT=':' ;;
		--file|-f)
			shift; MovieIndex=$1 ;;
		--all|-a)
			Seen='all' ;;
		--organize|-O)
			Organise='true' ;;
		--total|-t)
			Total='true' ;;
		--seen|-s)
			Seen='true' ;;
		--unseen|-u)
			Seen='false' ;;
		*)
			break ;;
	esac
	shift
done

DepCount=0
for Dep in mkdir mv; {
	if ! type -P "$Dep" &> /dev/null; then
		Err 0 "Dependency '$Dep' not met."
		let DepCount++
	fi
}

[ $DepCount -eq 0 ] || exit 1

if [[ $MAKE_LIST_OPT =~ (:|:\[+\]) ]]; then
	for FILE in **; {
		[ -f "$FILE" ] || continue
		IFS='/' read -a X <<< "${FILE% (*}"
		printf "%s%s: %s\n" "${X[0]}" "${MAKE_LIST_OPT#:}" "${X[1]}"
	}

	exit 0
fi

if ! [ "$Organise" == 'true' ]; then
	if [[ $1 =~ ^[0-9]+$ ]]; then
		Year=$1; shift
	else
		if ! [ "$Seen" == "all" ]; then
			Err 1 "Invalid year specified."
		fi
	fi
fi

[ -n "$*" ] && Err 1 "Incorrect argument(s) specified."

if [ "$Organise" == 'true' ]; then
	for X in *; {
		Y=${X//*\(}

	 [[ ${Y%\)*} =~ ^[0-9]+$ ]] || continue

		if mkdir "${Y%\)*}"; then
			printf "%s\n" "MAKE: ${Y%\)*}"
		else
			printf "%s\n" "Err: ${Y%\)*}"
		fi

		if mv "$X" ${Y%\)*}/; then
			printf "%s\n" "MOVE: ${Y%\)*}/${X//*\/}"
		else
			printf "%s\n" "Err: ${Y%\)*}/${X//*\/}"
		fi
	}

	exit 0
fi

[ -f "$MovieIndex" ] || Err 1 "Index file '$MovieIndex' not found."

declare -i Line=0
while read -r; do
	{ [[ $REPLY == +(#)* ]] || [ -z "$REPLY" ]; } && continue

	if [ "$Seen" == 'false'  ]; then
		if [[ $REPLY == $Year\[\+\]:\ * ]]; then
			printf "%s\n" "${REPLY/+([0-9])\[?\]: }"
			Line+=1
		fi
	elif [ "$Seen" == 'true'  ]; then
		if [[ $REPLY == $Year\[\-\]:\ * ]]; then
			printf "%s\n" "${REPLY/+([0-9])\[?\]: }"
			Line+=1
		fi
	elif [ "$Seen" == 'all'  ]; then
		printf "%s\n" "${REPLY/+([0-9])\[?\]: }"
		Line+=1
	fi
done < "$MovieIndex"

[ $Line -eq 0 ] && Err 1 "Unable to find year $Year."

if [ "$Total" == 'true' ]; then
	printf "\nTotal: %d\n" "$Line"
fi
