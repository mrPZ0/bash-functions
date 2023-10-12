. ./base-functions.sh

LOGLEVEL="DEBUG"

_logger_start "test-functions.log"

_msg_info " =i= test info"
_msg_error "!!! test error"
_msg_delimiter
_msg_info LOGLEVEL= ${LOGLEVEL}
_msg_delimiter
_log_info $__msg_delimiter
# LOGLEVEL=1
LOGLEVEL="ERROR" _log_error "log error"
# LOGLEVEL=2
LOGLEVEL="INFO" _log_info "log info"
# LOGLEVEL=3
LOGLEVEL="DEBUG" _log_debug "log debug"

_log_info $__msg_delimiter
LOGLEVEL="ERROR" __file_exist ./test-function.sh
LOGLEVEL="ERROR" __file_exist ./nullsh
_log_info $__msg_delimiter
LOGLEVEL="INFO" __cmd_exists "ls"
LOGLEVEL="ERROR" __cmd_exists "null"
_log_info $__msg_delimiter
#LEVEL1="2"
LOGLEVEL="DEBUG" __check_var "LEVEL1" "5"
LEVEL2="2"
LOGLEVEL="DEBUG" __check_var "LEVEL2" "10"
_log_info $__msg_delimiter
_logger_stop