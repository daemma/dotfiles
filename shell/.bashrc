### ############################################################################
##! @file       .bashrc
##! @brief      GNU Bourne Again SHell configuration
##! @author     0xD62EE11516877AA8
##! @date       2016-09-17
##! @copyright  GPLv3+

## this directory and file
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="$(basename "${BASH_SOURCE[0]}")"

if [ -z "$PS1" ] ; then
    ## If not running interactively, don't do anything
    return
else
    ## Source the main stuff
    __proFile="${__dir}/.shell.d/profile.sh"
    if [ -r "${__proFile}" ] ; then source "${__proFile}" ; 
    else
	## attempt default .bashrc
	echo -e "[] \e[0;31mError:\e[0m ${__file}: Failed to read ${__proFile}"
	__defBashrc="/etc/bash.bashrc"
	if [ -r "${__defBashrc}" ] ; then source "${__defBashrc}" ;
	else
	    echo -e \
		 "\e[1;31mAlert:\e[0m ${__file}: Failed to read ${__defBashrc}"
	fi
	unset __defBashrc
    fi
    unset __proFile
fi

## clean-up
unset __dir __file

### end .bashrc
### ############################################################################

