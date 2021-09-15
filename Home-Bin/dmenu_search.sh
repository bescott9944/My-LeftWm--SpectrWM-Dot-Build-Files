#!/bin/bash

# Small dmenu script that asks the user which search engine to use then ask for the user's query.
# Opens a webpage in the user's default browser

#The $BROWSER environement variable might not be set for you in which case the script will
# use Firefox by default.
if [[ -z "${BROWSER}" ]]; then
    BROWSER=$'google-chrome-stable'

fi

# If the user enters something other then one of the proposed search engines, the script defaults to google search the user's input

# Function to get the query of the user
# exits on empty query
get_query() {
        query=$(echo "" | dmenu -b -p "Search $engine_select": | sed 's/ /+/g')
        if [ $query == '']; then
            exit
        fi
}
# List of all the proposed engine
engine_list=$'Google
ArchWiki
DuckDuckGo
'

# Dmenu prompt
engine_select=$(echo "$engine_list" | dmenu -b -i -p "Select which SearchEngine")


case $engine_select in

    ArchWiki)
        get_query
        $BROWSER "https://wiki.archlinux.org/index.php?title=Special:Search&search="$query 
        ;;

    Google)
        get_query
        $BROWSER "https://www.google.com/search?q="$query
        ;;

    DuckDuckGo)
        get_query
        $BROWSER "https://duckduckgo.com/?q="$query
        ;;
    "")
        ;;


    *)
        query=$(echo $engine_select | sed 's/ /+/g')
        $BROWSER "https://www.google.com/search?q="$query 
        ;;
esac
