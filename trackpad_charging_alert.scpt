activate application "SystemUIServer"
set deviceName to "Magic Trackpad 2"

tell application "System Events"
	tell process "SystemUIServer"
		set bluetoothMenu to (menu bar item 1 of menu bar 1 whose description contains "bluetooth")
		tell bluetoothMenu
			click
			set trackpadItem to (menu item deviceName of menu 1)
			tell trackpadItem
				click
				set batteryLevelText to title of (menu item 3 of menu 1)
				key code 53 -- esc key
				set percentage to (do shell script ¬
					"echo " & batteryLevelText & " | egrep -o '[0-9]+'") as number
				if percentage < 10 then
					display notification "Battery percentage at " & percentage & "%" with title "Magic Trackpad 2" subtitle "Trackpad needs charging" sound name "Morse"
				end if
			end tell
		end tell
	end tell
end tell
