#!/bin/bash
# A screen
original_main_prompt="$(print_fill "+")\n$(print_center "Welcome message" ".")\n$(print_options "a] Does something" "b] Does something else" "x|q] exits")" 
main_prompt=$original_main_prompt

main_screen() {
	# main loop
	while [ $interupt -eq 0 ]; do
		# 300 is the time interval in seconds
		clear
		printf '%b\n' "$main_prompt"
		
		if read -n 1 -t 300; then
			clear_last_line
			case $REPLY in
			a|A)
				main_prompt+="$(a_pressed)\n";;
			b|B)
				main_prompt+="$(b_pressed)\n";;
			p|P)
				p_pressed;;
			x|X|Q|q)
				exit_thread;;
			(*)
				clear;;
			esac
		#else  ## optional time out function to call
		#	nothing_pressed
		fi
	done
	# end main loop
}
