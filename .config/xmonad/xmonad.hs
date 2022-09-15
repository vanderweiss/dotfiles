import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Layout.ThreeColumns

import XMonad.ManageHook

import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

import XMonad.Util.Dmenu
import XMonad.Util.Run

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import System.IO

myTerminal = "st"

myWorkspaces = ["1", "2", "3", "4", "5", "6"]

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , isDialog            --> doFloat
    ]

myFocusedBorderColor ="#9600ff" 
myModMask = mod4Mask

main :: IO ()
main = do 
	xmproc <- spawnPipe "xmobar"
	xmonad $ ewmhFullscreen $ ewmh $ xmobarProp $ docks $ myConfig xmproc

myConfig xmproc = def { 
	terminal			= myTerminal,
	workspaces			= myWorkspaces,
	modMask				= myModMask,
	focusedBorderColor	= myFocusedBorderColor,
	layoutHook			= avoidStruts $ myLayout,
	logHook				= dynamicLogWithPP xmobarPP 
							{ 
								ppOutput	= hPutStrLn xmproc,
								ppTitle		= xmobarColor "green" "" . shorten 50,
								ppCurrent	= xmobarColor "#98be65" "" . wrap "" ""
							}
}

