#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Source environment variables from .env_vars if the file exists
[[ ! -f ~/.config/shell/.env_vars ]] || source ~/.config/shell/.env_vars

# Source custom aliases from .aliases if the file exists
[[ ! -f ~/.config/shell/.aliases ]] || source ~/.config/shell/.aliases