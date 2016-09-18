#! /usr/bin/env bash
### ############################################################################
##! @file       Tails.sh
##! @brief      GNU Bourne Again SHell spcifics for Tails
##! @author     0xD62EE11516877AA8
##! @date       2015-11-14
##! @copyright  GPLv3+

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## Check for Tails Version command
tvCmd=$(which tails-version 2>/dev/null)
if [ ! -f "$tvCmd" ] || [ ! -x "$tvCmd" ] ; then
    ## TAILS not detected
    echo "Error: Failed to find 'tails-version'"
else
    ## Get Tails info
    export tails_version=$($tvCmd | head -n1 | awk -F" - " '{ print $1 }')
    export tails_date=$($tvCmd | head -n1 | awk -F" - " '{ print $2 }')
    export tails_id=$($tvCmd | head -n2 | tail -n1)
    export tails_build=$($tvCmd | head -n3 | tail -n1 | \
    				awk -F": " '{ print $2 }')
    export tails_boot=$($tvCmd | head -n4 | tail -n1 | \
    			       awk -F": " '{ print $2 }')
    export tails_config=$($tvCmd | head -n5 | tail -n1 | \
    				 awk -F": " '{ print $2 }')

    ## Set distro info
    export distro_id="Tails"
    export distro_name="The Amnesic Incognito Live System (${tails_date})"
    export distro_release="${tails_version}"
    export distro_code="${tails_id}"

    ## Package manager
    PkgMngr=~/.shell.d/software/apt.sh
    test -f "${PkgMngr}" && test -r "${PkgMngr}" && source "${PkgMngr}"

    ## check for persistence
    TailsData='/live/persistence/TailsData_unlocked'
    if [ -d "$TailsData" ] && [ -r "$TailsData" ]; then 
	export TailsData
	export Persistent="${TailsData}/Persistent"
    fi
fi


### end Tails.sh
### ############################################################################





# ## -----------------
# ## Tails
# tvCmd=$(which tails-version 2>/dev/null)
# if [ -f "$tvCmd" ] && [ -x "$tvCmd" ]; then
#     ## Tails specials
#     export tails_version=$($tvCmd | head -n1 | awk -F" - " '{ print $1 }')
#     export tails_date=$($tvCmd | head -n1 | awk -F" - " '{ print $2 }')
#     export tails_id=$($tvCmd | head -n2 | tail -n1)
#     export tails_build=$($tvCmd | head -n3 | tail -n1 | \
# 				awk -F": " '{ print $2 }')
#     export tails_boot=$($tvCmd | head -n4 | tail -n1 | \
# 			       awk -F": " '{ print $2 }')
#     export tails_config=$($tvCmd | head -n5 | tail -n1 | \
# 				 awk -F": " '{ print $2 }')
#     ## os definitions
#     export os_flavor="Tails"
#     export os_version="${tails_version}"
#     export os_desc="${os_flavor} ${tails_version} (${tails_date})"
#     export os_code="${tails_id}"
#     is_tails=1
#     ## check for persistence
#     TailsData='/live/persistence/TailsData_unlocked'
#     if [ -d "$TailsData" ] && [ -r "$TailsData" ]; then 
# 	is_tails_persistent=1
# 	export TailsData
# 	export Persistent="${TailsData}/Persistent"
#     else
# 	is_tails_persistent=0
#     fi
# else 
#     is_tails=0
#     is_tails_persistence=0
# fi
# unset tvCmd
