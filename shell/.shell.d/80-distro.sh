#!  /usr/bin/env bash
### ############################################################################
##! @file       20-distro.sh
##! @brief      Operating-System / Distribution information
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+


## +++++++++++++++++++++++++++++++++++++
## Operating System
export DISTRO_OS=$(uname --operating-system)

## Check for Tails
__tvCmd=$(get_which tails-version)
if [ -f "$__tvCmd" ] && [ -x "$__tvCmd" ] ; then
    ## Tails detected
    source "${__profDir}distros/Tails.sh"
else
    ## Tails not detected
    ## Use LSB (Linux Standard Base) and Distribution information
    __lsbCmd=$(get_which lsb_release)
    if [ ! -x "$__lsbCmd" ] ; then
        error "80-distro.sh: Failed to locate 'lsb_release'"
    else
	## Determine distribution info
        __lsbCmd+=" --short"
        export DISTRO_ID=$($__lsbCmd --id)
        export DISTRO_NAME=$($__lsbCmd --description)
        export DISTRO_RELEASE=$($__lsbCmd --release)
        export DISTRO_CODE=$($__lsbCmd --codename)
	## Source the distro specifics
	__distroFile="${__profDir}distros/${DISTRO_ID}.sh"
	if [ -f "${__distroFile}" ] && [ -r "${__distroFile}" ] ; then
	    source "${__distroFile}"
	else
	    error "80-distro.sh: Failed to source ${__distroFile}"
	fi
	unset DistroSpec
    fi
    unset __lsbCmd
fi
unset __tvCmd

## +++++++++++++++++++++++++++++++++++++
## print operating system information
function print_distro(){
    echo "distro: "
    echo "  os:        ${DISTRO_OS}"
    echo "  id:        ${DISTRO_ID}"
    echo "  name:      ${DISTRO_NAME}"
    echo "  release:   ${DISTRO_RELEASE}"
    echo "  code-name: ${DISTRO_CODE}"
}


### end 08-distro.sh
### ############################################################################
