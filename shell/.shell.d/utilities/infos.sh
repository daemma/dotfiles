#!  /usr/bin/env bash
### ############################################################################
##! @file       06-functions.sh
##! @brief      Utilities for informative printers
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## +++++++++++++++++++++++++++++++++++++
## print current time
function print_time(){
    echo "time: "
    echo "  local: $(date --rfc-3339='seconds')"
    echo "  utc:   $(date --rfc-3339='seconds' --utc)"
}

## +++++++++++++++++++++++++++++++++++++
## print user information
function print_user(){
    echo "user: "
    echo "  login: $(whoami)"
    echo "  name:  $(grep $(whoami) /etc/passwd | \
		     awk -F ':' '{print $5}' | \
		     awk -F ',' '{print $1}')"
}

## +++++++++++++++++++++++++++++++++++++
## print kernel information
function print_kernel(){
    echo "kernel: "
    echo "  name:    $(uname --kernel-name)"
    echo "  release: $(uname --kernel-release)"
    echo "  version: $(uname --kernel-version)"
}

## +++++++++++++++++++++++++++++++++++++
## print machine information
function print_machine(){
    echo "machine: "
    echo "  name:  $(uname --machine)"
    ## Type
    if [[ -n "${MACHTYPE:-}" ]] ; then
    echo "  type:  ${MACHTYPE}"
    fi
    ## machine-id
    local machIdFile='/etc/machine-id'
    if [ -f "$machIdFile" ] && [ -r "$machIdFile" ]; then
    echo "  id:    $(cat $machIdFile)"
    fi
}

## +++++++++++++++++++++++++++++++++++++
## print machine information
function print_hardware(){
    echo "hardware: "

    ## Platform
    local pltfrm=$(uname --hardware-platform)
    if [[ -n "${pltfrm:-}" ]] || [[ "${pltfrm}" == "unknown" ]] ; then
	pltfrm="$(uname --machine)"
    fi
    echo "  platform:  ${pltfrm}"

    ## Processor
    local procr=$(uname --processor)
    if [[ -n "${procr:-}" ]] || [[ "${procr}" == "unknown" ]] ; then
	procrList=$(cat /proc/cpuinfo | \
		    grep "model name" | \
		    awk -F ': ' '{print $2}')
	procrName=$(echo -e "$procrList" | head -n1)
	procrNum=$(echo -e "$procrList" | wc --line)
	procr="$procrName x$procrNum"
    fi
    echo "  processor: ${procr}"

    ## Memory
    echo "  memory:    $(free total --human | 
                         head -n2 | 
                         tail -n1 | \
                         awk '{ print $2 }' | 
                         head --bytes=-2) GiB"
    echo "  swap:      $(free total --human | 
                         tail -n1 | \
                         awk '{ print $2 }' | 
                         head --bytes=-2) GiB"
}

## +++++++++++++++++++++++++++++++++++++
## print dmi-decode information
function print_dmi_decodes(){
    local dmiCmd=$(get_which dmidecode)
    if [ -x "${dmiCmd}" ] ; then
	## check for super user
	if [ $EUID -ne 0 ]; then dmiCmd="sudo ${dmiCmd}" ; fi
	## use this to trigger privilege escalation 
	$(${dmiCmd} --version > /dev/null)
	## print the codes
	echo "dmi-codes: "
	for keywd in $(${dmiCmd} --string 2>&1 | tail -22 | \
		       awk '{ print $1 }') ; do
	    val=$(${dmiCmd} --string "$keywd")
	    printf "  %-25s: %s\n" "${keywd}" "${val}"
	done
	unset keywd
    else
	error "print_dmi_decodes: Failed to find 'dmidecode'"
    fi
}


### end functions.sh
### ############################################################################
