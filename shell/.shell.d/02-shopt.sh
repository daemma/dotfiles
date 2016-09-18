#!  /usr/bin/env bash
### ############################################################################
##! @file       02-shopt.sh
##! @brief      Control optional shell behavior
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+
##
##  See:
##    https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

shopt -s checkwinsize  ## update LINES and COLUMNS after each command
shopt -s nocaseglob    ## Case-insensitive globbing
shopt -s cdspell       ## Autocorrect typos in 'cd'
shopt -s cdable_vars   ## argument to the cd builtin command that is not a
                       ##   directory is assumed to be the name of a variable
                       ##   whose value is the directory to change to

### end 02-shopt.sh
### ############################################################################
