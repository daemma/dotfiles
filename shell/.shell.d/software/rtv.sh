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
    alias reddit='/usr/bin/torsocks ${REDDIT}'
    export RTV_EDITOR='/usr/bin/emacs'
    # export BROWSER='/usr/bin/w3m'

    ## From rtv github:
    ## XDG_HOME = os.getenv('XDG_CONFIG_HOME', os.path.join(HOME, '.config'))
    
else
    warning "Failed to find 'rtv'"
    unset REDDIT
fi


### end rtv.sh
### ############################################################################
