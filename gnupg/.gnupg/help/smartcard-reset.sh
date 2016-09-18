#!/usr/bin/env bash
### ############################################################################
##! @file       smartcard-reset.sh
##! @brief      
##! @author     0xD62EE11516877AA8
##! @date       2015-05-16
##! @copyright  GPLv3+

gpg-connect-agent < "${HOME}/.gnupg/smartcard-reset.txt"

### end smartcard-reset.sh
### ############################################################################
