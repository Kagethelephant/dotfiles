#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Kage: had to manually add the ~/bin and ~/.local/bin folder to the system path for the local scripts
export PATH=${HOME}/bin/:${HOME}/.local/bin:${PATH}
export EDITOR=nvim
export VISUAL=nvim


alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '⚛󱆃◯◀\033[35m\033[39m  
PS1='[ \W ] \033[32m\$\033[39m '


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


