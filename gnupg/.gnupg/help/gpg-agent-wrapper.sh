#!  /usr/bin/env bash
### ############################################################################
##! @file       gpg-agent-wrapper.sh
##! @brief      Some gpg-agent magic ...
##! @author     0xD62EE11516877AA8
##! @date       2015-05-16
##! @copyright  GPLv3+


# if ! pgrep -u ${USER} gpg-agent >/dev/null; then
#     gpg-connect-agent /bye
#     SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh;
#     export SSH_AUTH_SOCK;
# fi
# GPG_TTY=$(tty)
# export GPG_TTY

# Copyright (c) 2010 Diego E. Pettenò <flameeyes@gmail.com>
# Available under CC-BY license (Attribution)

## Check for agent, and fire it up
GPG_AGENT_INFO_FILE="${HOME}/.gnupg/gpg-agent.info"
if ! [ -f "${GPG_AGENT_INFO_FILE}" ] ||
   ! pgrep -u ${USER} gpg-agent >/dev/null; then
    gpg-agent --daemon \
	      --enable-ssh-support \
              --use-standard-socket \
	      --log-file ~/Temp/gpg-agent.log \
	      --write-env-file "${GPG_AGENT_INFO_FILE}"
fi
# if ! [ -f "$GPG_AGENT_INFO_FILE" ] ||
#    ! pgrep -u ${USER} gpg-agent >/dev/null; then
# 	gpg-agent --daemon \
# 	          --enable-ssh-support \
# 	          --scdaemon-program /usr/libexec/scdaemon \
# 	          --use-standard-socket \
# 	          --log-file ~/.gnupg/gpg-agent.log \
# 	          --write-env-file
# fi

## ssh-agent forwarding, override gnome-keyring though!
if [ -n ${SSH_AUTH_SOCK} ] && \
   [ ${SSH_AUTH_SOCK#/tmp/keyring-} = ${SSH_AUTH_SOCK} ]; then
    fwd_SSH_AUTH_SOCK=${SSH_AUTH_SOCK}
fi
export SSH_AUTH_SOCK

## fwd_SSH_AUTH_SOCK is not empty
# if [ "${fwd_SSH_AUTH_SOCK}" != "" ]; then
if [[ -n "${fwd_SSH_AUTH_SOCK:-}" ]] ; then 
    SSH_AUTH_SOCK=${fwd_SSH_AUTH_SOCK}
    export SSH_AUTH_SOCK
fi

## Source and export the agent-info
source "${GPG_AGENT_INFO_FILE}"
export GPG_AGENT_INFO
export SSH_AGENT_PID

## Point @ the TTY
GPG_TTY=$(tty)
export GPG_TTY

### end gpg-agent-wrapper.sh
### ############################################################################
