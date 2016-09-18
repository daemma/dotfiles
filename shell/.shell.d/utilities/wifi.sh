#!  /usr/bin/env bash
### ############################################################################
##! @file       wifi.sh
##! @brief      Utilities for WiFi      
##! @author     0xD62EE11516877AA8
##! @date       2016-09-16
##! @copyright  GPLv3+

## +++++++++++++++++++++++++++++++++++++
## Get the ESSID of the currently connected WiFi
function get_ssid(){
    local iwgetCmd=$(get_which iwgetid)
    if [ -n "${iwgetCmd}" ] && [ -x "${iwgetCmd}" ]; then
	echo "$(${iwgetCmd} --raw)"
    else
	error "get_ssid: 'iwgetid' command not found"
    fi
}

### end wifi.sh
### ############################################################################
