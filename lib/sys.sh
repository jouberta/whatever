#!/bin/bash
get_console_columns() {
	terminal=/dev/pts/1
	columns_tmp=$(stty size | awk '{print $2}')
	printf '%b' "$columns_tmp"
}
