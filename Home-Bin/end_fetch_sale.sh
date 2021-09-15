#!/usr/bin/env bash


# COLORS

set_colors() {
    c1="$(color "$1")${ascii_bold}"
    c2="$(color "$2")${ascii_bold}"
    c3="$(color "$3")${ascii_bold}"
    c4="$(color "$4")${ascii_bold}"
    c5="$(color "$5")${ascii_bold}"
    c6="$(color "$6")${ascii_bold}"

    [[ "$color_text" != "off" ]] && set_text_colors "$@"
}

set_text_colors() {
    if [[ "${colors[0]}" == "distro" ]]; then
        title_color="$(color "$1")"
        at_color="$reset"
        underline_color="$reset"
        subtitle_color="$(color "$2")"
        colon_color="$reset"
        info_color="$reset"

        # If the ascii art uses 8 as a color, make the text the fg.
        ((${1:-1} == 8)) && title_color="$reset"
        ((${2:-7} == 8)) && subtitle_color="$reset"

        # If the second color is white use the first for the subtitle.
        ((${2:-7} == 7)) && subtitle_color="$(color "$1")"
        ((${1:-1} == 7)) && title_color="$reset"
    else
        title_color="$(color "${colors[0]}")"
        at_color="$(color "${colors[1]}")"
        underline_color="$(color "${colors[2]}")"
        subtitle_color="$(color "${colors[3]}")"
        colon_color="$(color "${colors[4]}")"
        info_color="$(color "${colors[5]}")"
    fi

    # Bar colors.
    if [[ "$bar_color_elapsed" == "distro" ]]; then
        bar_color_elapsed="$(color fg)"
    else
        bar_color_elapsed="$(color "$bar_color_elapsed")"
    fi

    case ${bar_color_total}${1} in
        distro[736]) bar_color_total=$(color "$1") ;;
        distro[0-9]) bar_color_total=$(color "$2") ;;
        *)           bar_color_total=$(color "$bar_color_total") ;;
    esac
}

color() {
    case $1 in
        [0-6])    printf '%b\e[3%sm'   "$reset" "$1" ;;
        7 | "fg") printf '\e[37m%b'    "$reset" ;;
        *)        printf '\e[38;5;%bm' "$1" ;;
    esac
}

# OTHER

stdout() {
    image_backend="off"
    unset subtitle_color colon_color info_color underline_color bold title_color at_color \
          text_padding zws reset color_blocks bar_color_elapsed bar_color_total \
          c1 c2 c3 c4 c5 c6 c7 c8
}

err() {
    err+="$(color 1)[!]${reset} $1
"
}

get_distro_ascii() {
    # This function gets the distro ascii art and colors.
    #
    # $ascii_distro is the same as $distro.
    case $(trim "$ascii_distro") in        
        "EndeavourOS"*)
            set_colors 1 5 4
            read -rd '' ascii_data <<'EOF'
${c1}                     ./${c2}o${c3}.
${c1}                   ./${c2}sssso${c3}-
${c1}                 `:${c2}osssssss+${c3}-
${c1}               `:+${c2}sssssssssso${c3}/.
${c1}             `-/o${c2}ssssssssssssso${c3}/.
${c1}           `-/+${c2}sssssssssssssssso${c3}+:`
${c1}         `-:/+${c2}sssssssssssssssssso${c3}+/.
${c1}       `.://o${c2}sssssssssssssssssssso${c3}++-
${c1}      .://+${c2}ssssssssssssssssssssssso${c3}++:
${c1}    .:///o${c2}ssssssssssssssssssssssssso${c3}++:
${c1}  `:////${c2}ssssssssssssssssssssssssssso${c3}+++.
${c1}`-////+${c2}ssssssssssssssssssssssssssso${c3}++++-
${c1} `..-+${c2}oosssssssssssssssssssssssso${c3}+++++/`
   ./++++++++++++++++++++++++++++++/:.
  `:::::::::::::::::::::::::------``
EOF

    esac

    # Overwrite distro colors if '$ascii_colors' doesn't
    # equal 'distro'.
    [[ ${ascii_colors[0]} != distro ]] && {
        color_text=off
        set_colors "${ascii_colors[@]}"
    }
}
