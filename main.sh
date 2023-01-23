#!/bin/bash
### include libs #####
. $(dirname "$0")/lib/display.sh
. $(dirname "$0")/lib/sys.sh
. $(dirname "$0")/src/variables.sh
. $(dirname "$0")/src/tasks.sh
######################
clear
original_prompt="$(print_fill "+")\n$(print_center "Welcome message" ".")\n$(print_options "a] Does something" "b] Does something else" "x|q] exits")" 
prompt=$original_prompt

main_tread() {
	printf '%b\n' "$prompt"
}


# main loop
while [ $interupt -eq 0 ]; do
    # 300 is the time interval in seconds
    main_tread
    if read -n 1 -t 300; then
        clear_last_line
        case $REPLY in
        a|A)
            a_pressed;;
        b|B)
            b_pressed;;
        p|P)
            p_pressed;;
		x|X|Q|q)
			exit_thread;;
		(*)
			clear;;
        esac
    else
        nothing_pressed
    fi
done
# end main loop

# tear down
tear_down
