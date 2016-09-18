#!  /usr/bin/env bash
### ############################################################################
##! @file       03-completion.sh
##! @brief      Bash completions
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## Tab completion for many more commands
[ -r /etc/bash_completion ] && \
    source /etc/bash_completion
[ -r /usr/share/bash-completion/bash_completion ] && \
    source /usr/share/bash-completion/bash_completion

## Some specifics
complete -cf sudo
complete -cf man

### end completion.sh
### ############################################################################
