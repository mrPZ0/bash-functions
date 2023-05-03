. ./base-function.sh

__msg_info "test info"
__msg_error "test error"
__msg_delimiter
echo ${LOGLEVEL}
__msg_delimiter
LOGLEVEL="INFO" __dbg_info "dbg info"
LOGLEVEL="DEBUG" __dbg_debug "dbg "
LOGLEVEL="ERROR" __dbg_error "dbg error"
__msg_delimiter
LOGLEVEL="ERROR" __file_exist ./test-function.sh
LOGLEVEL="ERROR" __file_exist ./nullsh
__msg_delimiter
LOGLEVEL="INFO" __cmd_exists "ls"
LOGLEVEL="ERROR" __cmd_exists "null"