#!  /usr/bin/env bash
### ############################################################################
##! @file       01-umask.sh
##! @brief      Set the (default) umask
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## umask : Controls how file permissions are set for newly created files.
##         The default umask is set in /etc/profile
umask 0022  ## u=rwx,g=rx,o=rx
# umask 0027  ## u=rwx,g=rx,o=
# umask 0077  ## u=rwx,g=,o=

### end 01-umask.sh
### ############################################################################
