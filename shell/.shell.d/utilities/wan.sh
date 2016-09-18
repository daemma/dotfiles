#!  /usr/bin/env bash
### ############################################################################
##! @file       wan.sh
##! @brief      Utilities for Wide Area Network      
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## +++++++++++++++++++++++++++++++++++++
## Get (lookup) my external IP-address
function get_wan_ip(){
    # myip.datasystems24.de
    # dig +short myip.opendns.com @resolver1.opendns.com
    export IP=`dig +time=5 +short myip.opendns.com @resolver1.opendns.com`
    # echo $IP
}

function resolve_wan_ip(){
    if [[ -z "${IP}" ]]; then
	get_wan_ip
    fi
    export IPLOOKUP=`dig +short +time=5 @resolver1.opendns.com -x $IP | \
                     rev | cut -c 2- | rev`
}

## +++++++++++++++++++++++++++++++++++++
## print wan network information
function print_wan(){
    if [[ -z "${IP}" ]]; then
	get_wan_ip
	resolve_wan_ip
    fi
    echo "wan       :"
    echo "  ip      : ${IP}"
    echo "  resolve : ${IPLOOKUP}"
}

## +++++++++++++++++++++++++++++++++++++
## Update the WAN IP history file
function update_ip_history(){
    if [[ -z "${IP}" ]]; then
	get_wan_ip
	resolve_wan_ip
    fi
    echo "`date --rfc-3339='seconds'` $IP $IPLOOKUP" >> ~/.ip_history
}

### end wan.sh
### ############################################################################
