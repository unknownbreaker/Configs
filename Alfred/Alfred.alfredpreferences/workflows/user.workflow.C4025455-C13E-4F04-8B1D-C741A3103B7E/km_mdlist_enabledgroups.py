#!/usr/bin/env python3

from os.path import expanduser
import sys
import plistlib

strPathKM = expanduser("~") + "/Library/Application Support/Keyboard Maestro/Keyboard Maestro Macros.plist"

# Initialise the array of output items
arrItems = []

strDisabled = " [[DISABLED]]"

# Process the plist file
with open(strPathKM, "rb") as fp:
	pl = plistlib.load(fp)
	
	# Process all macro groups
	for objGroup in pl["MacroGroups"]:
		
		# Three things make a macro group viable for output
		# 1) it is not a smart group and so has "Targeting" enabled
		# 2) it contains macros (not sure if this is implicit with #1, so checking to be sure)
		# 3) it is enabled
		if "Targeting" in objGroup and "Macros" in objGroup and "IsActive" not in objGroup:
			print("- " + objGroup["Name"])