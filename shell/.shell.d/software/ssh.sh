#!  /usr/bin/env bash
### ############################################################################
##! @file       ssh.sh
##! @brief      SSH helpers
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## Add tab completion for SSH hostnames based on ~/.ssh/config, ignore *'s
export SSH_CONFIG="${HOME}/.ssh/config"
if [ -r "${SSH_CONFIG}" ]; then
    export SSH_HOSTS="$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | \
                        cut -d " " -f2 | tr ' ' '\n')"
    complete -o "default" -o "nospace" -W  "$SSH_HOSTS" scp sftp ssh
fi

## +++++++++++++++++++++++++++++++++++++
## Generate RSA ssh key
function ssh_gen_rsa(){
    local id="${1:-}"
    if [ -n "${id}" ]; then
	ssh-keygen -t rsa -b 4096 -o -a 100 -C "${id}" -f "${id}.id_rsa" \
		   >> "${id}.id_rsa.info"
    else
	ssh-keygen -t rsa -b 4096 -o -a 100            -f id_rsa \
		   >> "id_rsa.info"
    fi
}

## +++++++++++++++++++++++++++++++++++++
## Generate ED25519 ssh key
function ssh_gen_ed25519(){
    local id="${1:-}"
    if [ -n "${id}" ]; then
	ssh-keygen -t ed25519 -o -a 100 -C "${id}" -f "${id}.id_ed25519" \
		   >> "${id}.id_ed25519.info"
    else
	ssh-keygen -t ed25519 -o -a 100            -f id_ed25519 \
		   >> "id_ed25519.info"
    fi
}

### end ssh.sh
### ############################################################################
