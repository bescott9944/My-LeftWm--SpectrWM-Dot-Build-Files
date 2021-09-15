#!/usr/bin/env bash
Title () {
    printf -v Bar '%*s' $((${#1} + 6)) ' '
    #printf '%s\n## %s ##\n%s\n' "${Bar// /#}" "$1" "${Bar// /#}"
    # Add Bar=${Bar// /#} section. Can also change thes ##\n%s\n' to this \n%s\n'
    # to have no ending ## on the box
    Bar=${Bar// /#}
        printf '%s\n## %s ##\n%s\n' "$Bar" "$1" "$Bar"

}

Title 'This is a new line of Text'
