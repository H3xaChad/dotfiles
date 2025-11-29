## Remove welcome message
set fish_greeting

## Environment variables and aliases are sourced from conf.d/
## To regenerate them from ~/.config/shell/.env_vars and ~/.config/shell/.aliases
## run: ~/.config/fish/convert_shell_config.fish

## Run fastfetch if session is interactive
if status --is-interactive
   #fastfetch
end