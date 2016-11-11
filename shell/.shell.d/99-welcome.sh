#!  /usr/bin/env bash
### ############################################################################
##! @file       99-welcome.sh
##! @brief      Print a welcome message
##! @author     0xD62EE11516877AA8
##! @date       2016-08-20
##! @copyright  GPLv3+

## *****************************************************************************
## print welcome message
function print_welcome(){
    echo -ne "\e[2;37m"
    echo "---"
    echo "host  : ${HOSTNAME}"
    echo "user  : $(grep $(whoami) /etc/passwd | \
    		    awk -F ':' '{print $5}' | \
    		    awk -F ',' '{print $1}') ($(whoami))"
    echo "email : ${EMAIL}"
    echo "key   : ${KEY}"
    if [ -n "$SSH_CLIENT" ]; then
	local ll_from=`lastlog -u $(whoami) | sed -ne '2{p;q}' | cut -c 27-42`
	ll_at=`lastlog -u $(whoami) | sed -ne '2{p;q}' | cut -c 44-73`
	echo "last  : ${ll_at} from ${ll_from}"
    fi
    echo "..."
    echo -ne "\e[0m"
}
print_welcome

### end 99-welcome.sh
### ############################################################################
