# Auto-generated from ~/.config/shell/.aliases
# Run ~/.config/fish/convert_shell_config.fish to regenerate

# Useful aliases
alias ls='exa -al --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons'
alias ll='exa -l --color=always --group-directories-first --icons'
alias lt='exa -aT --color=always --group-directories-first --icons'
alias l.="exa -a | egrep '^\.'"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ff='fastfetch'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias ac='$EDITOR ~/.config/shell/.aliases'
alias ec='$EDITOR ~/.config/shell/.env_vars'
alias fixaudio='systemctl --user stop pipewire.socket && systemctl --user stop pipewire'
alias jctl='journalctl -p 3 -xb'
alias docker='sudo docker'
alias vencord-install='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'

alias vpnhomenetwork='wg-quick up homenetwork'

alias pacman='sudo pacman'
alias yay='yay --noconfirm'
alias paru='paru --noconfirm'
alias rmpaclock="sudo rm /var/lib/pacman/db.lck"
alias rmpkg="sudo pacman -Rdd"
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

alias java-g='archlinux-java get'
alias java-s='archlinux-java status'
alias java-set8='sudo archlinux-java set java-8-openjdk'
alias java-set11='sudo archlinux-java set java-11-openjdk'
alias java-set16='sudo archlinux-java set java-16-openjdk'

alias plasmarestart='killall plasmashell && kstart5 plasmashell'
alias fixkwin='setsid kwin_x11 --replace &'
alias mailspring='mailspring --password-store="kwallet5"'

alias getgpu='optimus-manager --print-mode'
alias integratedgpu='optimus-manager --switch integrated --no-confirm'
alias nvidiagpu='optimus-manager --switch nvidia --no-confirm'
alias hybridgpu='optimus-manager --switch hybrid --no-confirm'

alias wlan-monitor='sudo airmon-ng start wlan0 && sudo airmon-ng check kill'
alias wlan-managed='sudo airmon-ng stop wlan0mon && sudo systemctl restart NetworkManager'
alias airodump='sudo airodump-ng wlan0mon'
alias clearshakes='sudo rm ~/Documents/Aircrack/Handshakes/*'
alias deauth='sudo aireplay-ng wlan0mon --deauth'

# Skipped complex alias: cshack
