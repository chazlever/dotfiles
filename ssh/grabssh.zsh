# The following code is a modified version of Sam Rowe's solution to using
# SSH-Agent and a terminal multiplexer which can be found at the following:
# http://www.deadman.org/sshscreen.php

TMPDIR="${HOME}/.tmp"
FIXSSH="${TMPDIR}/fixssh"
mkdir -p "${TMPDIR}"

grab_ssh() {
   SSHVARS="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION DISPLAY"
   for x in $(echo ${SSHVARS});
   do
     (eval echo $x=\"\$$x\") | \
     sed 's/=/="/
          s/$/"/
          s/^/export /'
   done 
}

# Make sure we handle clobbering correctly
if [ -n "${BASH_VERSION}" ]; then
   grab_ssh 1>| "${FIXSSH}" 
elif [ -n "${ZSH_VERSION}" ]; then
   grab_ssh 1>! "${FIXSSH}"
fi

alias fixssh="source ${FIXSSH}"
unset TMPDIR FIXSSH SSHVARS
unset -f grab_ssh
