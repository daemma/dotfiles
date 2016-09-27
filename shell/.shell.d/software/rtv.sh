#!  /usr/bin/env bash
### ############################################################################
##! @file       rtv.sh
##! @brief      reddit terminal viewer aliases and helpers
##! @author     0xD62EE11516877AA8
##! @date       2016-09-24
##! @copyright  GPLv3+

REDDIT="${REDDIT:-$(get_which rtv)}"
if [ -x "${REDDIT}" ] ; then
    export REDDIT="${REDDIT}"
    alias reddit='torsocks ${REDDIT}'
else
    warning "Failed to find 'rtv'"
    unset REDDIT
fi


### end rtv.sh
### ############################################################################
