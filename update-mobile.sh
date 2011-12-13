#!/bin/bash

#
# Updates the graphs, html and resizes the images
#

/usr/share/munin/munin-graph --config=/etc/munin/munin-mobile.conf
/usr/share/munin/munin-html --config=/etc/munin/munin-mobile.conf

# Find images in mobile dir, files, *.png, modified between 0 and 3 minutes, not including images, resize with mogrify

# We no longer resize our images
# find /var/www/munin/mobile/ -type f -name "*.png"  -mmin +0 -mmin -3  -not -wholename "*images/*" -exec mogrify -resize 300 "{}" \;