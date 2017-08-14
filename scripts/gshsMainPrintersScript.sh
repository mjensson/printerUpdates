#!/bin/sh

#  Install_Main.sh
#  
#
#  Created by Matt Jensson on 05/28/15.
#

##################################################

##-- Delete all 2501, 2507, and 2707 printers currently installed --##
lpstat -p | awk '{print $2}' | while read printer
do
	if [[ $printer = Lanier_Rm_1707 ]] || [[ $printer = Lanier_Rm_2507 ]] || [[ $printer = Lanier_Rm_2707 ]] || [[ $printer = MagicColor_2501 ]] || \
	[[ $printer = gshsSharp1707 ]] || [[ $printer = gshsSharpCO ]]; then
		echo "Deleting Printer:" $printer && lpadmin -x $printer
	else
		echo "Skipping: " $printer
	fi
done

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

#################################################

##-- Install Updated Printers --##
lpadmin -p "gshsSharp1707" -D "GSHS 1707 Sharp Printer" -L "GSHS Rm 1707" \
-E -v lpd://10.25.01.22 -P "/Library/Printers/PPDs/Contents/Resources/SHARP MX-M654N.PPD.gz" \
-o printer-is-shared=false -o Option1=LSFinisher -o Option9=PModule33 -o media=Letter -o sides=one-sided

lpadmin -p "gshsSharpCO" -D "GSHS Counselor Sharp Printer" -L "GSHS Counselor Office" \
-E -v lpd://10.20.01.07 -P "/Library/Printers/PPDs/Contents/Resources/SHARP MX-M654N.PPD.gz" \
-o printer-is-shared=false -o Option1=LSFinisher -o Option9=PModule33 -o media=Letter -o sides=one-sided

lpadmin -p "gshsLanier2507" -D "GSHS 2507 Lanier Printer" -L "GSHS Rm 2507" \
-E -v lpd://10.25.01.23 -P "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP 6002.gz" \
-o printer-is-shared=false -o finisher=finEUPHRATESE -o media=Letter -o sides=one-sided

lpadmin -p "gshsLanier2707" -D "GSHS 2707 Lanier Printer" -L "GSHS Rm 2707" \
-E -v lpd://10.25.01.24 -P "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP 6002.gz" \
-o printer-is-shared=false -o finisher=finEUPHRATESE -o media=Letter -o sides=one-sided

lpadmin -p "gshsKonica2501" -D "GSHS 2501 Konica Printer" -L "GSHS Rm 2501" \
-E -v lpd://10.25.01.09 -P "/Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAmc8650.gz" \
-o printer-is-shared=false -o media=Letter

lpadmin -p "gshsHPM601LIB" -D "GSHS Lib HP600 Printer" -L "GSHS Library" \
-E -v lpd://10.25.01.03 -P "/Library/Printers/PPDs/Contents/Resources/HP LaserJet 600 M601 M602 M603.gz" \
-o printer-is-shared=false -o media=Letter -o sides=one-sided

lpadmin -p "gshsSharpLIB" -D "GSHS Lib Sharp Printer" -L "GSHS Library" \
-E -v lpd://10.25.01.15 -P "/Library/Printers/PPDs/Contents/Resources/SHARP MX-M364N.PPD.gz" \
-o printer-is-shared=false -o media=Letter -o sides=one-sided

lpadmin -p "gshsHPM551LIB" -D "GSHS Lib HP500 Printer" -L "GSHS Library" \
-E -v lpd://10.25.01.21 -P "/Library/Printers/PPDs/Contents/Resources/HP LaserJet 500 color M551.gz" \
-o printer-is-shared=false -o media=Letter -o sides=one-sided
#################################################