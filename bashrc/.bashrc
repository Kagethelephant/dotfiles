#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Kage: had to manually add the ~/bin and ~/.local/bin folder to the system path for the local scripts
export PATH=${HOME}/bin/:${HOME}/.local/bin:/usr/SFML/lib:/usr/SFML/include:${PATH}
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty
export TERM=kitty


alias ls='ls --color=auto'
alias grep='grep --color=auto'




# #=========================================================
# #Terminal Color Codes
# #=========================================================
# WHITE='\[\033[1;37m\]'
# LIGHTGRAY='\[\033[0;37m\]'
# GRAY='\[\033[1;30m\]'
# BLACK='\[\033[0;30m\]'
# RED='\[\033[0;31m\]'
# LIGHTRED='\[\033[1;31m\]'
# GREEN='\[\033[0;32m\]'
# LIGHTGREEN='\[\033[1;32m\]'
# BROWN='\[\033[0;33m\]' #Orange
# YELLOW='\[\033[1;33m\]'
# BLUE='\[\033[0;34m\]'
# LIGHTBLUE='\[\033[1;34m\]'
# PURPLE='\[\033[0;35m\]'
# PINK='\[\033[1;35m\]' #Light Purple
# CYAN='\[\033[0;36m\]'
# LIGHTCYAN='\[\033[1;36m\]'
# DEFAULT='\[\033[0m\]'
#
# #=========================================================
# # User Configuration
# #=========================================================
# # Colors
# cLINES=$GRAY #Lines and Arrow
# cBRACKETS=$GRAY # Brackets around each data item
# cERROR=$LIGHTRED # Error block when previous command did not return 0
# cTIME=$LIGHTGRAY # The current time
# cMPX1=$YELLOW # Color for terminal multiplexer threshold 1
# cMPX2=$RED # Color for terminal multiplexer threshold 2
# cBGJ1=$YELLOW # Color for background job threshold 1
# cBGJ2=$RED # Color for background job threshold 2
# cSTJ1=$YELLOW # Color for background job threshold 1
# cSTJ2=$RED # Color for  background job threshold 2
# cSSH=$PINK # Color for brackets if session is an SSH session
# cUSR=$LIGHTBLUE # Color of user
# cUHS=$GRAY # Color of the user and hostname separator, probably '@'
# cHST=$LIGHTGREEN # Color of hostname
# cRWN=$RED # Color of root warning
# cPWD=$BLUE # Color of current directory
# cCMD=$DEFAULT # Color of the command you type
#
# # Enable block
# eNL=1  # Have a newline between previous command output and new prompt
# eERR=1 # Previous command return status tracker
# eMPX=1 # Terminal multiplexer tracker enabled
# eSSH=1 # Track if session is SSH
# eBGJ=1 # Track background jobs
# eSTJ=1 # Track stopped jobs
# eUSH=1 # Show user and host
# ePWD=1 # Show current directory
#
# # Block settins
# MPXT1="0" # Terminal multiplexer threshold 1 value
# MPXT2="2" # Terminal multiplexer threshold 2 value
# BGJT1="0" # Background job threshold 1 value
# BGJT2="2" # Background job threshold 2 value
# STJT1="0" # Stopped job threshold 1 value
# STJT2="2" # Stopped job threshold 2 value
# UHS="@"
#
# function promptcmd()
# {
#         PREVRET=$?
#         #=========================================================
#         #check if user is in ssh session
#         #=========================================================
#         if [[ $SSH_CLIENT ]] || [[ $SSH2_CLIENT ]]; then
#                 lSSH_FLAG=1
#         else
#                 lSSH_FLAG=0
#         fi
#
#         #=========================================================
#         # Insert a new line to clear space from previous command
#         #=========================================================
#         PS1="\n"
#
#         #=========================================================
#         # Beginning of first line (arrow wrap around and color setup)
#         #=========================================================
#         PS1="${PS1}${cLINES}\342\224\214\342\224\200"
#
#         #=========================================================
#         # First Dynamic Block - Previous Command Error
#         #=========================================================
#         if [ $PREVRET -ne 0 ] ; then
#                 PS1="${PS1}${cBRACKETS}[${cERROR}:(${cBRACKETS}]${cLINES}\342\224\200"
#         fi
#
#         #=========================================================
#         # First static block - Current time
#         #=========================================================
#         PS1="${PS1}${cBRACKETS}[${cTIME}\t${cBRACKETS}]${cLINES}\342\224\200"
#
#         #=========================================================
#         # Detached Screen Sessions
#         #=========================================================
#         hTMUX=0
#         hSCREEN=0
#         MPXC=0
#         hash tmux --help 2>/dev/null || hTMUX=1
#         hash screen --version 2>/dev/null || hSCREEN=1
#         if [ $hTMUX -eq 0 ] && [ $hSCREEN -eq 0 ] ; then
#                 MPXC=$(echo "$(screen -ls | grep -c -i detach) + $(tmux ls 2>/dev/null | grep -c -i -v attach)" | bc)
#         elif [ $hTMUX -eq 0 ] && [ $hSCREEN -eq 1 ] ; then
#                 MPXC=$(tmux ls 2>/dev/null | grep -c -i -v attach)
#         elif [ $hTMUX -eq 1 ] && [ $hSCREEN -eq 0 ] ; then
#                 MPXC=$(screen -ls | grep -c -i detach)
#         fi
#         if [[ $MPXC -gt $MPXT2 ]] ; then
#                 PS1="${PS1}${cBRACKETS}[${cMPX2}\342\230\220:${MPXC}${cBRACKETS}]${cLINES}\342\224\200"
#         elif [[ $MPXC -gt $MPXT1 ]] ; then
#                 PS1="${PS1}${cBRACKETS}[${cMPX1}\342\230\220:${MPXC}${cBRACKETS}]${cLINES}\342\224\200"
#         fi
#
#         #=========================================================
#         # Backgrounded running jobs
#         #=========================================================
#         BGJC=$(jobs -r | wc -l )
#         if [ $BGJC -gt $BGJT2 ] ; then
#                 PS1="${PS1}${cBRACKETS}[${cBGJ2}&:${BGJC}${cBRACKETS}]${cLINES}\342\224\200"
#         elif [ $BGJC -gt $BGJT1 ] ; then
#                 PS1="${PS1}${cBRACKETS}[${cBGJ1}&:${BGJC}${cBRACKETS}]${cLINES}\342\224\200"
#         fi
#
#         #=========================================================
#         # Stopped Jobs
#         #=========================================================
#         STJC=$(jobs -s | wc -l )
#         if [ $STJC -gt $STJT2 ] ; then
#                 PS1="${PS1}${cBRACKETS}[${cSTJ2}\342\234\227:${STJC}${cBRACKETS}]${cLINES}\342\224\200"
#         elif [ $STJC -gt $STJT1 ] ; then
#                 PS1="${PS1}${cBRACKETS}[${cSTJ1}\342\234\227:${STJC}${cBRACKETS}]${cLINES}\342\224\200"
#         fi
#
#         #=========================================================
#         # Second Static block - User@host
#         #=========================================================
#         # set color for brackets if user is in ssh session
#         if [ $lSSH_FLAG -eq 1 ] ; then
#                 sesClr="$cSSH"
#         else
#                 sesClr="$cBRACKETS"
#         fi
#         # don't display user if root
#         if [ $EUID -eq 0 ] ; then
#                 PS1="${PS1}${sesClr}[${cRWN}!"
#         else
#                 PS1="${PS1}${sesClr}[${cUSR}\u${cUHS}${UHS}"
#         fi
#         PS1="${PS1}${cHST}\h${sesClr}]${cLINES}\342\224\200"
#
#         #=========================================================
#         # Third Static Block - Current Directory
#         #=========================================================
#         PS1="${PS1}[${cPWD}\w${cBRACKETS}]"
#
#         #=========================================================
#         # Second Line
#         #=========================================================
#         PS1="${PS1}\n${cLINES}\342\224\224\342\224\200\342\224\200> ${cCMD}"
# }
#
# function load_prompt () {
#     # Get PIDs
#     local parent_process=$(cat /proc/$PPID/cmdline | cut -d \. -f 1)
#     local my_process=$(cat /proc/$$/cmdline | cut -d \. -f 1)
#
#     if  [[ $parent_process == script* ]]; then
#         PROMPT_COMMAND=""
#         PS1="\t - \# - \u@\H { \w }\$ "
#     elif [[ $parent_process == emacs* || $parent_process == xemacs* ]]; then
#         PROMPT_COMMAND=""
#         PS1="\u@\h { \w }\$ "
#     else
#         export DAY=$(date +%A)
#         PROMPT_COMMAND=promptcmd
#      fi
#     export PS1 PROMPT_COMMAND
# }
#
# load_prompt






## Colors?  Used for the prompt.
#Regular text color
BLACK='\[\e[0;30m\]'
#Bold text color
BBLACK='\[\e[1;30m\]'
#background color
BGBLACK='\[\e[40m\]'
RED='\[\e[0;31m\]'
BRED='\[\e[1;31m\]'
BGRED='\[\e[41m\]'
GREEN='\[\e[0;32m\]'
BGREEN='\[\e[1;32m\]'
BGGREEN='\[\e[1;32m\]'
YELLOW='\[\e[0;33m\]'
BYELLOW='\[\e[1;33m\]'
BGYELLOW='\[\e[1;33m\]'
BLUE='\[\e[0;34m\]'
BBLUE='\[\e[1;34m\]'
BGBLUE='\[\e[1;34m\]'
MAGENTA='\[\e[0;35m\]'
BMAGENTA='\[\e[1;35m\]'
BGMAGENTA='\[\e[1;35m\]'
CYAN='\[\e[0;36m\]'
BCYAN='\[\e[1;36m\]'
BGCYAN='\[\e[1;36m\]'
WHITE='\[\e[0;37m\]'
BWHITE='\[\e[1;37m\]'
BGWHITE='\[\e[1;37m\]'

PROMPT_COMMAND=smile_prompt

function smile_prompt
{
if [ "$?" -eq "0" ]
then
#smiley
SC="${GREEN}:)"
else
#frowney
SC="${RED}:("
fi
if [ $UID -eq 0 ]
then
#root user color
UC="${RED}"
else
#normal user color
UC="${BWHITE}"
fi
#hostname color
HC="${BMAGENTA}"
#regular color
RC="${BWHITE}"
#default color
DF='\[\e[0m\]'
PS1="[${UC}\u${RC}@${HC}\h ${RC}\W${DF}] ${SC}${DF} "
}


# PS1='[\u@\h \W]\$ '⚛󱆃◯◀\033[35m\033[39m  
# PS1='[ \W ] \033[32m\$\033[39m '


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


