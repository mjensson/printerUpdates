# printerUpdates
GSHS Printer Update Repository

GSHS Printers is a metapackage that can install the Main, Office and/or Library printers. It is set to always install the main printers, but by clicking the “Customize Installation” button, you can select Office or Library printers to install as well. It is built from the three packages below::

gshsMainPrinters2017.pkg - Removes old 1707, 2501, 2507 and 2707 printers, copies in updated drivers to /Library/Printers, copies in appropriate PPD files to /Library/Printers/PPDs/Contents/Resources, then installs new printers with appropriate option settings.

gshsLibraryPrinters2017.pkg - Removes old Library printers, copies in appropriate PPD files to /Library/Printers/PPDs/Contents/Resources, then installs new printers with appropriate option settings.

gshsOfficePrinters2017.pkg - Removes old Office printers, copies in appropriate PPD files to /Library/Printers/PPDs/Contents/Resources, then installs new printers with appropriate option settings.


The three individual packages can be run separately (although the Main should always be run first), so that they might be able to pushed out through Managed Software Center (?). If that’s not possible, I can run the GSHS Printers.pkg locally.
