#!/usr/bin/env python3

from os.path import expanduser
import sys
import plistlib
import json
from subprocess import Popen, PIPE


def execAS(p_strAS):
	p = Popen(['osascript', '-'], stdin=PIPE, stdout=PIPE, stderr=PIPE, universal_newlines=True)
	stdout, stderr = p.communicate(p_strAS)
	return stdout

def getActiveBundleID():
	strAS = """tell application "System Events"
set _name to name of (first process whose frontmost is true)
end tell
tell application _name to return id as text"""
	# Execute the AppleScript, but we need to strip the extra newline that Alfred adds when it runs this script
	return execAS(strAS).rstrip("\n")


def getTitle(e):
	return e['title']

# Set the bundle ID
strBundleID = getActiveBundleID()
# Set the path to the Keyboard Maestro plist file
strPathKM = expanduser("~") + "/Library/Application Support/Keyboard Maestro/Keyboard Maestro Macros.plist"

# Initialise the array of output items
arrItems = []

# Process the plist file
with open(strPathKM, "rb") as fp:
	pl = plistlib.load(fp)
	
	# Process all macro groups
	for objGroup in pl["MacroGroups"]:
		
		# Three things make a macro group viable
		# 1) it is not a smart group and so has "Targeting" enabled
		# 2) it contains macros (not sure if this is implicit with #1, so checking to be sure)
		# 3) it is enabled
		if "Targeting" in objGroup and "Macros" in objGroup and "IsActive" not in objGroup:
			
			# Grab what the macro group is targeting
			objTargeting = objGroup["Targeting"]
			
			# No targeting apps will be listed for always available macros, so process them
			if not objTargeting["TargetingApps"]:
				for objMacro in objGroup["Macros"]:
					# Check we have a name for the macro and it is active
					if "Name" in objMacro and "IsActive" not in objMacro:
						objItem = {}
						objItem['title'] = objMacro["Name"]
						objItem['subtitle'] = objGroup["Name"] + " (" + objMacro["UID"] + ")"
						objItem['arg'] = objMacro["UID"]
						arrItems.append(objItem)
			# When tageting apps, we'll need to compare this to the active app bundle ID passed into this script
			else:
				# There can be multiple target apps, so we have to check them all to see if we have a matching bundle ID
				for objApp in objTargeting["TargetingApps"]:
					if objApp["BundleIdentifier"] == strBundleID:
						# Check we have a name for the macro and it is active
						for objMacro in objGroup["Macros"]:
							if "Name" in objMacro and "IsActive" not in objMacro:
								objItem = {}
								objItem['title'] = objMacro["Name"]
								objItem['subtitle'] = objGroup["Name"] + " (" + objMacro["UID"] + ")"
								objItem['arg'] = objMacro["UID"]
								arrItems.append(objItem)

# Sort the output array before passing to Alfred
arrItems.sort(key=getTitle)

# Output the JSON for Alfred
objOutput = { "items" : arrItems }
sys.stdout.write(json.dumps(objOutput))