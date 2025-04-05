for screen in $(xrandr --listmonitors | awk 'NR>1 {print $4}'); do
    konsole --fullscreen --profile Hollywood -e hollywood --qwindowgeometry $(xrandr --output $screen --current | grep -oP '\d+x\d+\+\d+\+\d+') &
done
