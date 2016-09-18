#!  /usr/bin/env bash
### ############################################################################
##! @file       history.sh
##! @brief      GNU Bourne Again SHell exports
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

export HISTCONTROL=ignoredups         # ignore duplicate lines
export HISTCONTROL=ignorespace        # ignore space lines
export HISTCONTROL=ignoreboth         # ignore same sucessive
export HISTIGNORE="ls:cd:pwd:exit"    # ignore these
export HISTSIZE=32768                 # History size = 32^3
export HISTFILESIZE=$HISTSIZE         # History file size = 32^3
shopt -s histappend                   # append history, no overwrite

### end history.sh
### ############################################################################
