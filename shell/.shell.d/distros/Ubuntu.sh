#!  /usr/bin/env bash
### ############################################################################
##! @file       Ubuntu.sh
##! @brief      GNU Bourne Again SHell spcifics for Ubuntu
##! @author     0xD62EE11516877AA8
##! @date       2015-11-14
##! @copyright  GPLv3+

## Package manager
__pkgmngrFile="${__profDir}package-managers/apt.sh"
if [ -f "${__pkgmngrFile}" ] && [ -r "${__pkgmngrFile}" ] ; then 
    source "${__pkgmngrFile}"
else
    error "Debian.sh: Failed to find ${__pkgmngrFile}"
fi
unset __pkgmngrFile

## +++++++++++++++++++++++++++++++++++++
## Check for a package
function check_pkg() {
    dpkg --status "${1}" 2>&1 | grep Status
}

### end Ubuntu.sh
### ############################################################################
