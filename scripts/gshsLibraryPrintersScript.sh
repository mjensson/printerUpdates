#!/bin/sh

#  Install_Library.sh
#  
#
#  Created by Matt Jensson on 05/28/15.
#
##################################################

##-- Delete Old Library Printers currently installed --##
lpstat -p | awk '{print $2}' | while read printer
do
	if [[ $printer = Library__BizHub_200 ]] || [[ $printer = Library__HP_Color_LJ_500 ]] || [[ $printer = Library__HP_LJ_600 ]]; then
		echo "Deleting Printer:" $printer && lpadmin -x $printer
	else
		echo "Skipping: " $printer
	fi
done

##################################################
##-- Install Updated Library Printers --##
lpadmin -p "gshsHPM601LIB" -D "GSHS Lib HP600 Printer" -L "GSHS Library" \
-E -v lpd://10.25.01.03 -P "/Library/Printers/PPDs/Contents/Resources/HP LaserJet 600 M601 M602 M603.gz" \
-o printer-is-shared=false -o media=Letter -o sides=one-sided

lpadmin -p "gshsSharpLIB" -D "GSHS Lib Sharp Printer" -L "GSHS Library" \
-E -v lpd://10.25.01.15 -P "/Library/Printers/PPDs/Contents/Resources/SHARP MX-M364N.PPD.gz" \
-o printer-is-shared=false -o media=Letter -o sides=one-sided

lpadmin -p "gshsHPM551LIB" -D "GSHS Lib HP500 Printer" -L "GSHS Library" \
-E -v lpd://10.25.01.21 -P "/Library/Printers/PPDs/Contents/Resources/HP LaserJet 500 color M551.gz" \
-o printer-is-shared=false -o media=Letter -o sides=one-sided