#  -*- sh -*- 
function prompt
{

local BLACK="\[\033[0;30m\]"
local BLUE="\[\033[0;34m\]"
local GREEN="\[\033[0;32m\]"
local CYAN="\[\033[0;36m\]"
local RED="\[\033[0;31m\]"
local PURPLE="\[\033[0;35m\]"
local BROWN="\[\033[0;33m\]"
local LIGHT_GRAY="\[\033[0;37m\]"

local GRAY="\[\033[1;30m\]"
local LIGHT_BLUE="\[\033[1;34m\]"
local LIGHT_GREEN="\[\033[1;32m\]"
local LIGHT_CYAN="\[\033[1;36m\]"
local LIGHT_RED="\[\033[1;31m\]"
local LIGHT_PURPLE="\[\033[1;35m\]"
local YELLOW="\[\033[1;33m\]"
local WHITE="\[\033[1;37m\]"

local NONE="\[\033[0m\]"

if [ "$USER" == "root" ]; then
    COLOR=$LIGHT_RED
elif [ -n $SSH_CLIENT ]; then
    COLOR=$YELLOW
else
    COLOR=$GREEN
fi
local temp=$(tty)
local GRAD1=${temp:5}
PS1="$COLOR\u@\h$NONE $LIGHT_PURPLE[\W]$NONE $COLOR>$NONE " 
PS2="$LIGHT_RED ... >$NONE "
}

function setbnlproxy
{
sudo cp /etc/perl/CPAN/Config.pm.bnl /etc/perl/CPAN/Config.pm
}

function setnoproxy
{
sudo cp /etc/perl/CPAN/Config.pm.noproxy /etc/perl/CPAN/Config.pm
}
