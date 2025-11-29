### FISH-CONFIG OF USER DAVID

## Remove welcome message
set fish_greeting

## Set nvim as default editor
export EDITOR="/usr/bin/nvim"

## Source environment variables from .env_vars if the file exists
if test -f ~/.config/shell/.env_vars
    bass source ~/.config/shell/.env_vars
end

## Source custom aliases from .aliases if the file exists
if test -f ~/.config/shell/.aliases
    bass source ~/.config/shell/.aliases
end

## Run neofetch if session is interactive
if status --is-interactive
   #neofetch
end
