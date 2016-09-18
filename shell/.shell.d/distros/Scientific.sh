#! /usr/bin/env bash
### ############################################################################
##! @file       Scientific.sh
##! @brief      GNU Bourne Again SHell spcifics for Scientific
##! @author     0xD62EE11516877AA8
##! @date       2015-11-14
##! @copyright  GPLv3+

## Package manager
__pkgmngrFile="${__profDir}package-managers/yum.sh"
if [ -f "${__pkgmngrFile}" ] && [ -r "${__pkgmngrFile}" ] ; then 
    source "${__pkgmngrFile}"
else
    error "Scientific.sh: Failed to find ${__pkgmngrFile}"
fi
unset __pkgmngrFile

### end Scientific.sh
### ############################################################################
