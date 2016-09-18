#!  /usr/bin/env bash
### ############################################################################
##! @file       logger.sh
##! @brief      Logging helpers
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+
##  See: https://github.com/kvz/bash3boilerplate/blob/master/main.sh

export LOG_LEVEL="${LOG_LEVEL:-5}"     ## 6=debug ... 0=fatal
export LOG_NOCOLOR="${LOG_NOCOLOR:-}"  ## true = disable color, otherwise autodetected

function _fmt () {
  local color_reset="\x1b[0m"
  local color_debug="\x1b[1;37m"
  local color_info="\x1b[0;32m"
  local color_notice="\x1b[0;36m"
  local color_warning="\x1b[0;33m"
  local color_error="\x1b[0;31m"
  local color_alert="\x1b[1;31m"
  local color_fatal="\x1b[1;4;33;41m"
  local colorvar=color_$1

  local color="${!colorvar:-$color_error}"
  if [ "${LOG_NOCOLOR}" = "true" ] || [[ "${TERM:-}" != "xterm"* ]] || [ -t 1 ]; then
    # Don't use colors on pipes or non-recognized terminals
    color=""; color_reset=""
  fi
  echo -e "$(date -u +"%Y-%m-%d %H:%M:%S UTC") ${color}$(printf "[%7s]" ${1})${color_reset}";
}

function fatal () {                                 echo "$(_fmt fatal) ${@}" 1>&2 || true; } #exit 1; }
function alert ()     { [ "${LOG_LEVEL}" -ge 1 ] && echo "$(_fmt alert) ${@}" 1>&2 || true; }
function error ()     { [ "${LOG_LEVEL}" -ge 2 ] && echo "$(_fmt error) ${@}" 1>&2 || true; }
function warning ()   { [ "${LOG_LEVEL}" -ge 3 ] && echo "$(_fmt warning) ${@}" 1>&2 || true; }
function notice ()    { [ "${LOG_LEVEL}" -ge 4 ] && echo "$(_fmt notice) ${@}" 1>&2 || true; }
function info ()      { [ "${LOG_LEVEL}" -ge 5 ] && echo "$(_fmt info) ${@}" 1>&2 || true; }
function debug ()     { [ "${LOG_LEVEL}" -ge 6 ] && echo "$(_fmt debug) ${@}" 1>&2 || true; }

function print_log_examples(){
    debug   "Info useful to developers."
    info    "Normal operational messages."
    notice  "Events that are unusual but not error conditions."
    warning "Warning messages, but not an error"
    error   "Non-urgent failures."
    alert   "Should be corrected immediately."
    fatal   "A \"panic\" condition usually affecting multiple apps/servers/sites."
}
# print_log_examples

### end logger.sh
### ############################################################################
