#!/bin/bash

function date_format_1 {
	linux_date_command="date +%Y-%m-%d-%H-%M"
	macos_date_command="date -jf"
	windows_date_command="date "
	date_command=""
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	date_command=${linux_date_command}
	elif [[ "$OSTYPE" == "darwin"* ]]; then
	date_command=${macos_date_command}
	elif [[ "$OSTYPE" == "msys"* ]]; then
	date_command=${windows_date_command}
	fi
}