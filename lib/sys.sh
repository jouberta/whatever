#!/bin/bash
get_console_columns() {
	terminal=/dev/pts/1
	COLUMNS=$(stty size | awk '{print $2}')
	printf '%b' "$cloumns"
}
