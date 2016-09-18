#!  /usr/bin/env bash
### ############################################################################
##! @file       tor.sh
##! @brief      Tor anonymizing software
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## find and extract information
export TOR="${TOR:-$(get_which tor)}"
if [ -n "${TOR}" ] && [ -x "${TOR}" ] ; then
    export TOR_CONF="/etc/tor/torrc"
    export TOR_DATA="/var/lib/tor"
    export TOR_LOG="/var/log/tor/notices.log"

    alias tor-status="systemctl status tor.service"
    if [ $EUID -ne 0 ]; then
	## use sudo when user
	alias tor-reload="sudo systemctl reload tor.service"
	alias tor-restart="sudo systemctl restart tor.service"
	alias tor-start="sudo systemctl start tor.service"
	alias tor-stop="sudo systemctl stop tor.service"
	alias tor-enable="sudo systemctl enable tor.service"
	alias tor-disable="sudo systemctl disable tor.service"
	## arm: anonymizing relay monitor 
	alias tor-arm="sudo -u tor arm"
    else
	## root don't need no sudo
	alias tor-reload="systemctl reload tor.service"
	alias tor-restart="systemctl restart tor.service"
	alias tor-start="systemctl start tor.service"
	alias tor-stop="systemctl stop tor.service"
	alias tor-enable="systemctl enable tor.service"
	alias tor-disable="systemctl disable tor.service"
	## arm: anonymizing relay monitor 
	alias tor-arm="su -u tor arm"
    fi
else
    ## variable empty || not-executable
    unset TOR
fi

## +++++++++++++++++++++++++++++++++++++
## print cern-root information
function print_tor(){
    echo "tor : "
    echo "  path : ${TOR}"
    echo "  conf : ${TOR_CONF}"
    echo "  data : ${TOR_DATA}"
}

### end tor.sh
### ############################################################################
