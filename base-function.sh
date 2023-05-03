#!/usr/bin/env bash
#
# default functions for scripts
#


# function err()
# 
#
# if ! do_something; then
#   err "Unable to do_something"
#   exit 1
# fi
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

red="\e[31m"
green="\e[32m"
endcolors="\e[0m"
light_cyan="\e[96m"
delimiter_str="="
delimiter_len=79


function __msg_delimiter() {
    local result
    local i
    for i in $(seq 1 $delimiter_len); do  result+="$delimiter_str"; done
    echo $result
}
function __dbg_error() {
    [[ "${LOGLEVEL}" == "ERROR" ]] && echo -e "[$(date +'%Y-%m-%dT%H:%M:%S%z') ${LOGLEVEL}]: $*" >&2
}

function __dbg_debug() {
    [[ "${LOGLEVEL}" == "DEBUG" ]] && echo -e "[$(date +'%Y-%m-%dT%H:%M:%S%z') ${LOGLEVEL}]: $*"
} 

function __dbg_info() {
    [[ "${LOGLEVEL}" == "INFO" ]] && echo -e "[$(date +'%Y-%m-%dT%H:%M:%S%z') ${LOGLEVEL}]: $*"
}

function __msg_error() {
    printf "${red}!!! %s${endcolors}\\n" "${*}" 1>&2
}
function __msg_info() {
    printf "${light_cyan}___ %s${endcolors}\\n" "${*}" 1>&2
}

function __cmd_exists()
{
    command -v "$1" >/dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        __dbg_info "$1 found"
        return 0
    else
        __dbg_error "$1 not found"
        return 1
    fi
}
function __file_exist()
{
    if [[ -z "$1" ]]; then
        __dbg_error "filename is empty"
        return 1
    fi
    if ! [[ -e $1 ]]; then
        __dbg_error "file $1 not found"
        return 1
    fi
}
