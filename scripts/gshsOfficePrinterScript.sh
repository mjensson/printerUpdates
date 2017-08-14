#!/bin/sh

#  Install_Office.sh
#  
#
#  Created by Matt Jensson on 05/28/15.
#
##################################################

##-- Delete Old Office printers currently installed --##
lpstat -p | awk '{print $2}' | while read printer
do
	if [[ $printer = Front_Off_HP_4200 ]] || [[ $printer = Front_Off_Lanier ]] || [[ $printer = Back_Off_HP_P3015 ]]; then
		echo "Deleting Printer:" $printer && lpadmin -x $printer
	else
		echo "Skipping: " $printer
	fi
done

##################################################
##-- Install Updated Office Printers --##

lpadmin -p "gshsHPM604FO" -D "GSHS Office HPM604 Printer" -L "GSHS Front Office" \
-E -v lpd://10.20.01.04 -P "/Library/Printers/PPDs/Contents/Resources/HP Laserjet M604 M605 M606.gz" \
-o printer-is-shared=false -o media=Letter -o sides=one-sided

lpadmin -p "gshsLanierFO" -D "GSHS Office Lanier Printer" -L "GSHS Front Office" \
-E -v lpd://10.20.01.03 -P "/Library/Printers/PPDs/Contents/Resources/LANIER MP C2800_LD528C.gz" \
-o printer-is-shared=false -o finisher=finKING -o duplex=DuplexNoTumble -o OptionTray=2Cassette \
-o media=Letter -o sides=one-sided

lpadmin -p "gshsHPP3015FO" -D "GSHS Office HPP3015 Printer" -L "GSHS Front Office" \
-E -v lpd://10.20.01.11 -P "/Library/Printers/PPDs/Contents/Resources/HP LaserJet P3010 Series.gz" \
-o printer-is-shared=false -o media=Letter -o sides=one-sided