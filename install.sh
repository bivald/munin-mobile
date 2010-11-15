#!/bin/bash
echo ""
echo "Mobile Munin Template Installer"
echo ""
echo "This will create the following directories: "
echo " ./var/www/munin/mobile"
echo " ./etc/munin/templates-mobiles"
echo ""
echo "And copy the following files:"
echo " ./munin-mobile.conf   -> /etc/munin/munin-mobile.conf"
echo " ./templates-mobiles/* -> /etc/munin/templates-mobiles/"
echo " ./mobile-www/*        -> /var/www/munin/mobile/*"
echo " ./update-mobile.sh    -> /etc/munin/update-mobile.sh"
echo ""
echo "It also sets the permissions to the same as your munin files"
echo ""
echo "############################################################"
echo ""

if [ $1 ]
then
    if [ $1 == "--auto" ]
    then
	    echo "- Auto-continue supplied as argument"
	    continue='Y'
     else
	echo -n "Continue? [Y]: "
	read continue
     fi
else
    echo -n "Continue? [Y]: "
    read continue
fi

if [[ $continue == "Y" || $continue == "y" ]]; then
        echo "- Continuing..."
        echo ""
else
        echo "OK, exiting."
        exit
fi

if [ -f /etc/munin/munin-mobile.conf ]
then
    echo "-  /etc/munin/munin-mobile.conf       - file exists! (not copied)"
else
    echo "- ./munin-mobile.conf -> /etc/munin/munin-mobile.conf"
    cp `pwd`/munin-mobile.conf /etc/munin/munin-mobile.conf    
    chown /etc/munin/munin-mobile.conf --reference=/etc/munin/munin.conf
fi    

echo "- ./templates-mobiles                 -> /etc/munin/templates-mobiles"

if [ ! -d /etc/munin/templates-mobiles ]
then
    mkdir /etc/munin/templates-mobiles
fi

cp `pwd`/templates-mobiles/* /etc/munin/templates-mobiles/
chown -R /etc/munin/templates-mobiles --reference=/etc/munin/templates

echo "- ./mobile-www                        -> /var/www/munin/mobile"

if [ ! -d /var/www/munin/mobile ]
then
    mkdir /var/www/munin/mobile
fi

cp -r `pwd`/mobile-www/* /var/www/munin/mobile
chown -R /var/www/munin/mobile --reference=/var/www/munin

echo "- ./update-mobile.sh                 -> /etc/munin/update-mobile.sh"

cp update-mobile.sh /etc/munin/
chown /etc/munin/update-mobile.sh --reference=/etc/munin/munin-mobile.conf

chmod 755 /etc/munin/update-mobile.sh

echo ""
echo "Finished!"

