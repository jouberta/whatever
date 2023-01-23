#!/bin/bash
### Console display helpers

# Prints first argument in center of console
print_center() {
	msg_length=${#1}
	fill_length=$(($COLUMNS - $msg_length - padding ))
	left_fill=$(($fill_length / 2))
	right_fill=$(($fill_length - $left_fill - padding ))
	for i in $(seq 1 1 $left_fill); do printf "$2";  done
	for i in $(seq 1 1 $padding); do printf " ";  done
	printf "$1"
	for i in $(seq 1 1 $padding); do printf " ";  done
	for i in $(seq 1 1 $right_fill); do printf "$2";  done
}

print_padded() {
	msg_length=${#1}
	fill_length=$(($COLUMNS - $msg_length - padding - padding - padding ))
	for i in $(seq 1 1 $padding); do printf "$2";  done
	for i in $(seq 1 1 $padding); do printf " ";  done
	printf "$1"
	for i in $(seq 1 1 $fill_length); do printf " ";  done
	for i in $(seq 1 1 $padding); do printf "$2";  done
}

print_padded_centered() {
	msg_length=${#1}
	fill_length=$(($COLUMNS - $msg_length - padding ))
	left_fill=$(($fill_length / 2))
	right_fill=$(($fill_length - $left_fill - padding ))
	for i in $(seq 1 1 $padding); do printf "$2";  done
	for i in $(seq 1 1 $left_fill); do printf " ";  done
	printf "$1"
	for i in $(seq 1 1 $right_fill); do printf " ";  done
	for i in $(seq 1 1 $padding); do printf "$2";  done
}

print_fill() {
	fill=""
	for i in $(seq 1 1 $COLUMNS); do fill+="$1";done
	printf $fill
}

print_options() {
	printf '%b\n' $(print_fill "+")
	for arg in "$@"; do print_padded "$arg" "."; printf "\n"; done
	printf '%b\n' $(print_fill "=")
}

clear_last_line() {
	printf "\r\033[K"
}
