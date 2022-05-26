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
		
		# Two things make a macro group viable for output
		# 1) it is not a smart group and so has "Targeting" enabled
		# 2) it contains macros (not sure if this is implicit with #1, so checking to be sure)
		if "Targeting" in objGroup and "Macros" in objGroup:
			
			if "IsActive" not in objGroup:
				print("- **" + objGroup["Name"] + "**")
			else:
				print("- **" + objGroup["Name"] + "**" + strDisabled)
			
			for objMacro in objGroup["Macros"]:
				# IsActive only present when set to 'NO'
				if "Name" in objMacro and "IsActive" not in objMacro:
					print("	- " + objMacro["Name"])
				if "Name" in objMacro and "IsActive" in objMacro:
					print("	- " + objMacro["Name"] + strDisabled)

