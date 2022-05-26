#!/usr/bin/env python3

from os.path import expanduser
import sys
import plistlib

strPathKM = expanduser("~") + "/Library/Application Support/Keyboard Maestro/Keyboard Maestro Macros.plist"

# Initialise the array of output items
arrItems = []

strDisabled = " [[DISABLED]]"
strSmart = " [[SMART]]"

# Process the plist file
with open(strPathKM, "rb") as fp:
	pl = plistlib.load(fp)
	
	# Process all macro groups
	for objGroup in pl["MacroGroups"]:
			if "Macros" in objGroup:
				if "IsActive" not in objGroup:
					print("- " + objGroup["Name"])
				else:
					print("- " + objGroup["Name"] + strDisabled)
			else:
				if "IsActive" not in objGroup:
					print("- " + objGroup["Name"] + strSmart)
				else:
					# This one currently can't occur, but Keyboard Maestro may support this in the future
					print("- " + objGroup["Name"] + strSmart + strDisabled)