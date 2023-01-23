#!/bin/bash

# define functions here
exit_thread() {
    # command(s) to be run if the 'a' key is pressed
    interupt=1
}

a_pressed() {
    # commands for if 'a' is pressed
    printf "A task has been run"
}

b_pressed() {
    # commands for if 'b' is pressed
    printf "B task has been run"
}

p_pressed() {
    # commands for if 'p' is pressed
    print_padded "Running a process." " "
    sleep 4
    print_padded "Process update details:" " "
    sleep 2
    print_padded "More progress" " "
	sleep 10
    print_center "Process complete" " "
    print_fill "+"
    print_padded "Press any key to continue" "#"
    print_fill "="
    if read -n 1 -t 300; then
		clear_last_line
    fi
}

nothing_pressed() {
    # command(s) to be run if nothing is pressed after a certain time interval
    exit_thread
}

tear_down() {
	printf "exiting...\n"
}
