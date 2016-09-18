#!  /usr/bin/env bash
### ############################################################################
##! @file       profile.sh
##! @brief      GNU Bourne Again SHell profile
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

LOG_LEVEL=5          ## 6 = debug ... 0 = fatal
LOG_NOCOLOR="false"  ## use color log messages

## This directory
__profDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

## Load the PII
__piiFile="${__profDir}/pii.sh"
[ -f "${__piiFile}" ] && source "${__piiFile}"

## Load the shell dotfiles
if [ -d "${__profDir}" ]; then
    files=$(ls -l "${__profDir}"*.sh | \
	    awk '{ print $9 }' | \
	    grep [0-9])    
    for file in $files ; do
	# echo "${file}"
	[ -f "$file" ] && [ -r "$file" ] && source "$file"
    done
    unset files file
else
    echo -e "\e[1;33;41mAlert:\e[0m profile.sh: Failed to find ${__profDir}"
fi

## clean-up
unset __profDir __piiFile
# unset LOG_LEVEL NO_COLOR

### end profile.sh
### ############################################################################
