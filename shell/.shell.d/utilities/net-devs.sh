#!  /usr/bin/env bash
### ############################################################################
##! @file       net-devs.sh
##! @brief      Utilities for network devices
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## +++++++++++++++++++++++++++++++++++++
## Print information for all network devices 
function print_net_devs(){
    local ipCmd=$(get_which ip)
    if [ -n "${ipCmd}" ] && [ -x "${ipCmd}" ]; then
	echo "network-devices : "
	for netdev in $(ls -l /sys/class/net/ | awk '{ print $9 }') ; do
	    if [ "X${netdev}" != "Xlo" ]; then
	     echo "  - name : ${netdev}"
	     echo "    mac  : $(${ipCmd} address show ${netdev} | \
				grep "link/ether" | \
				awk '{ print $2 }')"
	     echo "    ip4  : $(${ipCmd} address show ${netdev} | \
		 		grep "inet " | \
		 		awk '{ print $2 }')"
    	     echo "    ip6  : $(${ipCmd} address show ${netdev} noprefixroute | \
		 		grep "inet6" | \
		 		awk '{ print $2 }')"
	    fi
	done
	unset netdev
    else
	error "print_net_devs: 'ip' command not found"
    fi
}
# print_net_devs

## +++++++++++++++++++++++++++++++++++++
## Get MAC address for network device 
function get_net_dev_mac(){
    local ipCmd=$(get_which ip)
    if [ -n "${ipCmd}" ] && [ -x "${ipCmd}" ]; then
	local netdev="${1}"
	if [ -n "${netdev}" ] ; then
	    echo "$(${ipCmd} address show ${netdev} | \
		    grep "link/ether" | \
		    awk '{ print $2 }')"
	else
	    warning "get_net_dev_mac: No device given"
	    print_net_devs
	fi
    else
	error "get_net_dev_mac: 'ip' command not found"
    fi
}

## +++++++++++++++++++++++++++++++++++++
## Get IPv4 address for network device 
function get_net_dev_ip4(){
    local ipCmd=$(get_which ip)
    if [ -n "${ipCmd}" ] && [ -x "${ipCmd}" ]; then
	local netdev="${1}"
	if [ -n "${netdev}" ] ; then
	    echo "$(${ipCmd} address show ${netdev} | \
		    grep "inet " | \
		    awk '{ print $2 }')"
	else
	    warning "get_net_dev_ip4: No device given"
	    print_net_devs
	fi
    else
	error "get_net_dev_ip4: 'ip' command not found"
    fi
}

## +++++++++++++++++++++++++++++++++++++
## Get IPv6 address for network device 
function get_net_dev_ip6(){
    local ipCmd=$(get_which ip)
    if [ -n "${ipCmd}" ] && [ -x "${ipCmd}" ]; then
	local netdev="${1}"
	if [ -n "${netdev}" ] ; then
	    echo "$(${ipCmd} address show ${netdev} noprefixroute | \
		    grep "inet6" | \
		    awk '{ print $2 }')"
	else
	    warning "get_net_dev_ip6: No device given"
	    print_net_devs
	fi
    else
	error "get_net_dev_ip6: 'ip' command not found"
    fi
}

### end net-devs.sh
### ############################################################################
