
#!  /usr/bin/env bash
### ############################################################################
##! @file       editor.sh
##! @brief      Set the default editor
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## Default editor
export EMACS="${EDITOR:-$(which emacs)}"
if [ -x "$EDITOR" ] ; then
    export EDITOR="${EMACS} -nw"
    export SUDO_EDITOR="${EDITOR}"
else
    export EDITOR="nano"
    export SUDO_EDITOR="${EDITOR}"
fi
unset EMACS

### end editor.sh
### ############################################################################
