. ./base-functions.sh

__msg_info "test info"
__msg_error "test error"
__msg_delimiter
echo ${LOGLEVEL}
__msg_delimiter
LOGLEVEL="INFO" __log_info "log info"
LOGLEVEL="DEBUG" __log_debug "log debug"
LOGLEVEL="ERROR" __log_error "log error"
__msg_delimiter
LOGLEVEL="ERROR" __file_exist ./test-function.sh
LOGLEVEL="ERROR" __file_exist ./nullsh
__msg_delimiter
LOGLEVEL="INFO" __cmd_exists "ls"
LOGLEVEL="ERROR" __cmd_exists "null"
__msg_delimiter
#LEVEL1="2"
LOGLEVEL="DEBUG" __check_var "LEVEL1" "5"