#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|
#

#--------------------#
# Bootstraping
#--------------------#

# If not running interactively, don't do anything.
if [[ $- != *i* ]] ; then
    return
fi

#--------------------#
# Basic setup
#--------------------#

# I prefer less to more.
export PAGER=less
export MANPAGER=less

# I prefer to set both EDITOR and VISUAL to Vim or Neovim.
export EDITOR=nano
export VISUAL=nvim

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
HISTSIZE=10000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [[ -n $force_color_prompt ]]; then
    if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
            color_prompt=yes
    else
            color_prompt=
    fi
fi

# Set a default prompt.
PS1='\[\033[01;31m\]\u\[\033[01;33m\]@\[\033[01;36m\]\h \[\033[01;33m\]\w \[\033[01;35m\]\$ \[\033[00m\]'

# Uncomment if you want to try an advanced prompt.
#PS1="\[\e[0;34m\]┌─[\[\e[1;33m● \h\e[0;34m\]]─[\[\e[1;36m\u\e[0;34m\]]─[\e[1;37m\w\e[0;34m]─\[$(tput sgr0)\]\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\A\[$(tput sgr0)\]\[\033[38;5;7m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]$_EXIT_STATUS_STR: \$\[\e[0;34m\]\n\[\e[0;34m\]└─╼ \[\e[1;35m\]>> \[\e[00;00m\]"

# Enable Bash completion.
if [[ -f /usr/local/share/bash-completion/bash_completion.sh ]]; then
    source /usr/local/share/bash-completion/bash_completion.sh
fi
#--------------------#
# Plugins
#--------------------#

# fzf
if [[ -d '/usr/local/share/examples/fzf/' ]]; then
    source /usr/local/share/examples/fzf/shell/completion.bash
    source /usr/local/share/examples/fzf/shell/key-bindings.bash
fi

#--------------------#
# Aliases
#--------------------#

source ~/.aliases
source ~/.envvar

# Let sh(1) know it's at home, despite /home being a symlink.
if [ "$PWD" != "$HOME" ] && [ "$PWD" -ef "$HOME" ] ; then cd ; fi

# Query terminal size; useful for serial lines.
if [ -x /usr/bin/resizewin ] ; then /usr/bin/resizewin -z ; fi

# Display a random cookie on each login.
if [ -x /usr/bin/fortune ] ; then /usr/bin/fortune freebsd-tips ; fi
