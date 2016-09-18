#!  /usr/bin/env bash
### ############################################################################
##! @file       Arch.sh
##! @brief      GNU Bourne Again SHell specifics for Arch Linux
##! @author     0xD62EE11516877AA8
##! @date       2015-11-14
##! @copyright  GPLv3+

## Package manager
__pkgmngrFile="${__profDir}package-managers/pacman.sh"
if [ -f "${__pkgmngrFile}" ] && [ -r "${__pkgmngrFile}" ] ; then 
    source "${__pkgmngrFile}"
else
    error "Arch.sh: Failed to find ${__pkgmngrFile}"
fi
unset __pkgmngrFile

### end Arch.sh
### ############################################################################
