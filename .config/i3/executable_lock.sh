#!/bin/bash
set -e

PICTURE=~/Desktop/rick.png

insidecolor=00000000
ringcolor=ffffffff
keyhlcolor=d23c3dff
bshlcolor=d23c3dff
separatorcolor=00000000
insidevercolor=00000000
insidewrongcolor=d23c3dff
ringvercolor=ffffffff
ringwrongcolor=ffffffff
verifcolor=ffffffff
timecolor=ffffffff
datecolor=ffffffff
loginbox=00000066
font="sans-serif"
locktext='Type password to unlock...'


cleanup() {
	xset dpms 0 0 0
}

trap cleanup HUP INT TERM EXIT
# Turn off screen after 10 seconds
xset +dpms dpms 0 0 10
# Take screenshot using imagemagick
import -window root /tmp/locking_screen.png

convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
convert -composite /tmp/screen_blur.png "$PICTURE" \
				-gravity South \
				-geometry -20x1200 /tmp/screen.png

i3lock \
  -t -i '/tmp/screen.png' \
  --timepos='x+110:h-70' \
  --datepos='x+43:h-45' \
  --clock --date-align 1 --datestr "$locktext" \
  --insidecolor=$insidecolor --ringcolor=$ringcolor --line-uses-inside \
  --keyhlcolor=$keyhlcolor --bshlcolor=$bshlcolor --separatorcolor=$separatorcolor \
  --insidevercolor=$insidevercolor --insidewrongcolor=$insidewrongcolor \
  --ringvercolor=$ringvercolor --ringwrongcolor=$ringwrongcolor --indpos='x+280:h-70' \
  --radius=20 --ring-width=4 --veriftext='' --wrongtext='' \
  --verifcolor="$verifcolor" --timecolor="$timecolor" --datecolor="$datecolor" \
  --time-font="$font" --date-font="$font" --layout-font="$font" \
	--verif-font="$font" --wrong-font="$font" \
  --noinputtext='' --force-clock "$lockargs"

cleanup
# Turn the screen off after a delay.
sleep 15
# pgrep i3lock > /dev/null && i3exit suspend

