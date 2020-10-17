config="$HOME/.config/polybar/bar.ini"
bar_name="one"
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --config=$config --reload $bar_name &
  done
else
  polybar --config=$config --reload $bar_name &
fi
