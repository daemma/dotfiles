### ############################################################################
##! @file       .bash_logout
##! @brief      Executed by bash when login shell exits.
##! @author     0xD62EE11516877AA8
##! @date       2016-09-17
##! @copyright  GPLv3+

# when leaving the console clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
    clear
    reset
fi

### end .bash_logout
### ############################################################################
