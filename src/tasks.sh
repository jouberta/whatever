#!/bin/bash

# define functions here
exit_thread() {
    # command(s) to be run if the 'a' key is pressed
    interupt=1
}

a_pressed() {
    # commands for if 'b' is pressed
    clear
	prompt=$original_prompt
}

b_pressed() {
    # commands for if 'b' is pressed
    clear
    prompt='B has been run'
}

p_pressed() {
    # commands for if 'b' is pressed
    printf "New prompt\n"
    if read -n 1 -t 300; then
		clear_last_line
        case $REPLY in
        a|A)
            printf "A pressed\n";;
        b|B)
            printf "B pressed\n";;
        p|P)
            printf "P pressed\n"
            p_pressed;;
        esac
    else
        nothing_pressed
    fi
    prompt="p has been run\n${original_prompt}"
}

nothing_pressed() {
    # command(s) to be run if nothing is pressed after a certain time interval
    exit_thread
}

tear_down() {
	printf "exiting...\n"
}
