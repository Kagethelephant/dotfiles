#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Kage: had to manually add the ~/bin and ~/.local/bin folder to the system path for the local scripts
export PATH=${HOME}/bin/:${HOME}/.local/bin:${PATH}


alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

