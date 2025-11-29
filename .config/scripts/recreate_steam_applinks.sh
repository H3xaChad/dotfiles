#!/usr/bin/env bash
# Recreate Steam game .desktop files system-wide
# Supports --dry-run and debug prints

set -euo pipefail
shopt -s nullglob

USER_APP_DIR="$HOME/.local/share/applications"
SYSTEM_APP_DIR="/usr/share/applications"
ICON_DIR="$HOME/.local/share/icons/hicolor"

DRYRUN=0
DEBUG=0

# Parse flags
for arg in "$@"; do
    case "$arg" in
        --dry-run) DRYRUN=1 ;;
        --debug) DEBUG=1 ;;
        *) echo "Unknown argument: $arg"; exit 1 ;;
    esac
done

log() { [[ $DEBUG -eq 1 ]] && echo "[DEBUG] $*"; }

echo "Scanning Steam shortcuts in $USER_APP_DIR..."

for desktop in "$USER_APP_DIR"/steam_app_*.desktop; do
    [ -f "$desktop" ] || continue

    log "Processing $desktop"

    # Helper function to extract entry
    get_entry() { grep -m1 "^$1=" "$desktop" | cut -d= -f2-; }

    game_name=$(get_entry Name)
    exec_line=$(get_entry Exec)
    icon_path=$(get_entry Icon)

    # Resolve icon
    if [[ ! -f "$icon_path" ]]; then
        icon_candidate=$(find "$ICON_DIR" -maxdepth 3 -type f -name "$(basename "$desktop" .desktop).png" | head -n1)
        if [[ -n "$icon_candidate" ]]; then
            icon_path="$icon_candidate"
            log "Found icon: $icon_path"
        else
            icon_path="/usr/share/icons/hicolor/256x256/apps/steam.png"
            log "Using fallback Steam icon"
        fi
    fi

    # Target system-wide .desktop
    system_desktop="$SYSTEM_APP_DIR/$(basename "$desktop")"

    log "Would create: $system_desktop"
    log "Name=$game_name"
    log "Exec=$exec_line"
    log "Icon=$icon_path"

    if [[ $DRYRUN -eq 0 ]]; then
        sudo tee "$system_desktop" > /dev/null <<EOF
[Desktop Entry]
Name=$game_name
Exec=$exec_line
Icon=$icon_path
Type=Application
Categories=Game;
StartupNotify=true
EOF
    fi
done

echo "Done. Use --dry-run to preview actions without writing files."
