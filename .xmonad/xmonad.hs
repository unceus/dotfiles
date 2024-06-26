import System.IO
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.FloatNext
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spiral
import XMonad.Layout.PerWorkspace(onWorkspace)
import XMonad.Layout.Tabbed
import XMonad.Layout.SimpleFloat
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W
import qualified Data.Map as M


------------------------------------------------------------------------
-- Terminal
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal = "/usr/bin/urxvt"


------------------------------------------------------------------------
-- Workspaces
-- The default number of workspaces (virtual screens) and their names.
--
myWorkspaces = ["one","two","three","four","five"] ++ map show [6..9]


------------------------------------------------------------------------
-- Window rules
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ resource =? "desktop_window"  --> doIgnore
    , className =? "Galculator"     --> doFloat
    , className =? "Steam"          --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource =? "gpicview"        --> doFloat
    , className =? "MPlayer"        --> doFloat
    , className   =? "Download"     --> doFloat
    , className =? "Progress"       --> doFloat
    , className =? "steam"          --> doFullFloat -- bigpicture-mode
    , title =? "Steam_Login"        --> doFloat
    , className =? "Steam"          --> doShift "three"
    , title =? "Steam_Login"        --> doShift "three"
--    , isFullscreen --> (doF W.focusDown <+> doFullFloat)]
    , isFullscreen                  --> doFullFloat ]

------------------------------------------------------------------------
-- Layouts
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts. Note that each layout is separated by |||,
-- which denotes layout choice.
--
defaultLayouts = avoidStruts (
    Tall 1 (3/100) (1/2) |||
    Mirror (Tall 1 (3/100) (1/2)) |||
    Full |||
    spiral (6/7)) |||
    noBorders (fullscreenFull Full)

------------------------------------------------------------------------
-- Colors and borders
--
myNormalBorderColor = "#002b36"
myFocusedBorderColor = "#657b83"

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.


-- Color of current window title in xmobar.
xmobarTitleColor = "green"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

-- Width of the window border in pixels.
myBorderWidth = 1


------------------------------------------------------------------------
-- Key bindings
--
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt"). You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod1Mask

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  ----------------------------------------------------------------------
  -- Custom key bindings
  --

  -- Start a terminal. Terminal to start is specified by myTerminal variable.
  [ ((modMask .|. shiftMask, xK_Return),
     spawn $ XMonad.terminal conf)

 -- Takes screenshot
  , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s -e 'mv $f ~dana/Pictures/Screenshots'")
  , ((0, xK_Print), spawn "scrot -e 'mv $f ~dana/Pictures/Screenshots'")


  , ((modMask, xK_p),
     spawn "exe=`dmenu_path_c | yeganesh` && eval \"exec $exe\"")

  -- Mute volume.
  , ((0, 0x1008ff12), spawn "amixer -q set Master toggle")

  -- Decrease volume.
  , ((0, 0x1008ff11), spawn "pactl set-sink-volume 0 -5%")

  -- Increase volume.
  , ((0, 0x1008ff13), spawn "pactl set-sink-volume 0 +5%")

  -- Lower brightness
  , ((0, 0x1008ff03), spawn "brightness $(( $(brightness) - 100 ))")

  -- Raise brightness
  , ((0, 0x1008ff02), spawn "brightness $(( $(brightness) + 100 ))")

  -- Lock with mod+f1
  , ((modMask, 0xffbe),
     spawn "i3lock")

  -- Plex
  , ((modMask, 0x70),
     spawn "plexmediaplayer")

  -- Nemo (file manager)
  , ((modMask, xK_n),
     spawn "nemo")

  -- Git-cola
  , ((modMask, 0x67),
     spawn "git-cola")

  , ((modMask, xK_f), toggleFloatAllNew)
  -- Chrome
  , ((modMask, 0x63),
     spawn "firefox")

  -- Dict8
  , ((modMask, 0x64),
     spawn "~/.scripts/dictate")

  -- Play/pause.
  , ((0, 0x1008FF14),
     spawn "")

  -- Audio next.
  , ((0, 0x1008FF17),
     spawn "")

  -- Eject CD tray.
  , ((0, 0x1008FF2C),
     spawn "eject -T")

  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings
  --

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_c),
     kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space),
     sendMessage NextLayout)

  -- Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_r),
     refresh)

  -- Move focus to the next window.
  , ((modMask, xK_Tab),
     windows W.focusDown)

  -- Move focus to the next window.
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_k),
     windows W.focusUp )

  -- Move focus to the master window.
  , ((modMask, xK_m),
     windows W.focusMaster )

  -- Swap the focused window and the master window.
  , ((modMask, xK_Return),
     windows W.swapMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown )

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp )

  -- Shrink the master area.
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Toggle the status bar gap.
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_q),
     io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask, xK_q),
     restart "xmonad" True)
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  ++

  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings
--
-- Focus rules
-- True if your focus should follow your mouse cursor.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask, button1),
     (\w -> focus w >> mouseMoveWindow w))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2),
       (\w -> focus w >> windows W.swapMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3),
       (\w -> focus w >> mouseResizeWindow w))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]

------------------------------------------------------------------------
-- Startup hook
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q. Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = return ()

------------------------------------------------------------------------
-- Floats all windows in a certain workspace.
-- myLayouts
myLayouts = defaultLayouts

------------------------------------------------------------------------
-- Run xmonad with all the defaults we set up.
--
--main = xmonad =<< xmobar defaultConfig { terminal = "urxvt" }

main = do
 xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
 xmonad $ defaults
      { manageHook = floatNextHook <+> manageDocks <+> manageHook defaultConfig
      , layoutHook = avoidStruts $ myLayouts
      , logHook = dynamicLogWithPP xmobarPP
           { ppOutput = hPutStrLn xmproc
           , ppTitle = xmobarColor "#657b83" "" . shorten 100
           , ppCurrent = xmobarColor "#c0c0c0" "" . wrap "" ""
           , ppSep     = xmobarColor "#c0c0c0" "" " | "
           , ppUrgent  = xmobarColor "#ff69b4" ""
           , ppLayout = const "" -- to disable the layout info on xmobar
           }
     }


------------------------------------------------------------------------
-- Combine it all together
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
defaults = defaultConfig {
    -- simple stuff
		handleEventHook = mconcat
			[ docksEventHook
			, handleEventHook defaultConfig ],
    terminal = myTerminal,
    focusFollowsMouse = myFocusFollowsMouse,
    borderWidth = myBorderWidth,
    modMask = myModMask,
    workspaces = myWorkspaces,
    normalBorderColor = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys = myKeys,
    mouseBindings = myMouseBindings,

    -- hooks, layouts
    -- defaultLayouts = smartBorders $ myLayout,
    -- layoutHook = myLayouts,
    manageHook = myManageHook,
    startupHook = myStartupHook
}
