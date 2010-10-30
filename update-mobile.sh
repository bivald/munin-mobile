#!/bin/bash

#
# Updates the graphs, html and resizes the images
#

/usr/share/munin/munin-graph --config=/etc/munin/munin-mobile.conf
/usr/share/munin/munin-html --config=/etc/munin/munin-mobile.conf

# Find images in mobile dir, files, *.png, modified between 0 and 3 minutes, not including images, resize with mogrify
find /var/www/munin/mobile/ -type f -name "*.png"  -mmin +0 -mmin -3  -not -wholename "*images/*" -exec mogrify -resize 300 "{}" \;

# Old, obsolete labour intensive resize

exit
cd /var/www/munin/mobile

for file in `dir -d *` ; do
    if [ -d "/var/www/munin/mobile/$file" ]
    then
        if [ $file != "images" ] # Dont resize our template images, we probably should check css/js here as well...
            then
                /usr/bin/mogrify -resize 300 /var/www/munin/mobile/$file/*.png
            fi
    fi    
done
