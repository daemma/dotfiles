#!  /usr/bin/env bash
### ############################################################################
##! @file       utilities.sh
##! @brief      Load utility functions      
##! @author     0xD62EE11516877AA8
##! @date       2016-08-21
##! @copyright  GPLv3+

## Load the utility files
__utilDir="${__profDir}/utilities/"
# debug "utilities.sh: __utilDir: ${__utilDir}"
if [ -d "${__utilDir}" ]; then
    files=$(ls -l "${__utilDir}"*.sh | \
	    awk '{ print $9 }')    
    for file in $files ; do
	# debug "utilities.sh: file: ${file}"
	[ -f "$file" ] && [ -r "$file" ] && source "$file"
    done
    unset files file
fi
unset __utilDir


### end network.sh
### ############################################################################
