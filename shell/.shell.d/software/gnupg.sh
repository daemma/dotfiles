#!  /usr/bin/env bash
### ############################################################################
##! @file       gnupg.sh
##! @brief      GnuPG helpers
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+



### end gnupg.sh
### ############################################################################


# ## +++++++++++++++++++++++++++++++++++++
# ## GnuPG & Agent
# gpgCmd=$(which gpg 2>/dev/null)
# gpgVersion=$($gpgCmd --version | head -n1 | awk '{ print $3 }')
# gpgVmajor=$(echo "$gpgVersion" | awk -F. '{ print $1 }')
# gpgVminor=$(echo "$gpgVersion" | awk -F. '{ print $2 }')
# gpgVpatch=$(echo "$gpgVersion" | awk -F. '{ print $3 }')
# ## check major version
# if [ $gpgVmajor -le 1 ] ; then
#     echo "Error: gpg version ${gpgVersion}"
# else
#     ## check minor version
#     if [ $gpgVminor -le 0 ] ; then
# 	## Old: gnupg-v2.0.x
# 	export GPG_AGENT_WRAPPER="${HOME}/.gnupg/help/gpg-agent-wrapper.sh"
# 	if [ -f "$GPG_AGENT_WRAPPER" ] ; then
# 	    source "$GPG_AGENT_WRAPPER"
# 	fi
#     else
# 	## Modern
# 	export GPG_TTY=$(tty)
# 	unset SSH_AGENT_PID
# 	if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
# 	    export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
# 	fi
# 	gpg-connect-agent --quiet /bye
#     fi
# fi
