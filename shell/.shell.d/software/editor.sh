#!  /usr/bin/env bash
### ############################################################################
##! @file       editor.sh
##! @brief      Set the default editor
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## Default editor
export EDITOR="${EDITOR:-$(which emacs)}"
if [ -x "$EDITOR" ] ; then
    export SUDO_EDITOR="emacs"
else
    export EDITOR="nano"
    export SUDO_EDITOR="nano"
fi
# debug "EDITOR: ${EDITOR}"
# debug "SUDO_EDITOR: ${SUDO_EDITOR}"

### end editor.sh
### ############################################################################
