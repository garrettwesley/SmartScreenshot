--
--  AppDelegate.applescript
--  SmartScreenshot
--
--  Created by Garrett Wesley on 12/30/18.
--  Copyright © 2018 Garrett Wesley. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    property StatusItem : missing value
    property selectedMenu : ""
    property bar: missing value
    property theDisplay : ""
    property newMenu : class "NSMenu"
	
	on applicationWillFinishLaunching_(aNotification)
        my makeStatusBar()
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		return current application's NSTerminateNow
	end applicationShouldTerminate_
    
    
    on makeStatusBar()

        set bar to current application's NSStatusBar's systemStatusBar
        set StatusItem to bar's statusItemWithLength:-1.0
        StatusItem's setTitle:"💾"
        set newMenu to current application's NSMenu's alloc()'s initWithTitle:"Custom"
        my makeMenus()
        StatusItem's setMenu:newMenu
        
    end makeStatusBar
    
    
    
    on makeMenus()
        
        set menuItems to {"SaveLocation", "Screenshot", "ScreenCapture", "Quit"}
        set commands to {"", "3", "4", ""}
        repeat with i from 1 to number of items in menuItems
            set this_item to item i of menuItems
            set command to item i of commands
            set thisMenuItem to (current application's NSMenuItem's alloc()'s initWithTitle:this_item action:"onClick:" keyEquivalent:command)
            
            (newMenu's addItem:thisMenuItem)
            (thisMenuItem's setTarget:me) -- required for enabling the menu item
            
             -- add a seperator after first and third item
            if (i is equal to 3) or (i is equal to 1) then
                (newMenu's addItem:(current application's NSMenuItem's separatorItem))
            end if
        end repeat
    end makeMenus
    
    on onClick:sender
        set aTag to tag of sender as integer
        set aTitle to title of sender as string
        
        if aTitle is equal to "Quit" then
            current application's NSStatusBar's systemStatusBar()'s removeStatusItem:StatusItem
        else
            display dialog aTitle as string
        end if
    end onClick:
    
    
    
    
    
	
end script
