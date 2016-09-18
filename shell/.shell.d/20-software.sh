#!  /usr/bin/env bash
### ############################################################################
##! @file       softawre.sh
##! @brief      Software exports
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## Load the utility files
__softDir="${__profDir}software/"
#debug "20-software.sh: __softDir: ${__softDir}"
if [ -d "${__softDir}" ]; then
    files=$(ls -l "${__softDir}"*.sh | \
	    awk '{ print $9 }')    
    for file in $files ; do
	# debug "utilities.sh: file: ${file}"
	[ -f "$file" ] && [ -r "$file" ] && source "$file"
    done
    unset files file
fi
unset __softDir

### end software.sh
### ############################################################################
