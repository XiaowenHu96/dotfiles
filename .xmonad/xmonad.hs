--
-- xmonad example config file.
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--

import XMonad
import XMonad.Hooks.DynamicLog
import Data.Monoid
import System.Exit
import System.IO
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicProperty
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.ResizableTile
import XMonad.Layout.Grid
import XMonad.Layout.Renamed
import XMonad.Layout.Tabbed
import XMonad.Layout.SubLayouts
import XMonad.Layout.Simplest
import XMonad.Layout.WindowNavigation
import XMonad.Layout.BoringWindows 
import XMonad.Layout.Spacing
import XMonad.Layout.Magnifier
import XMonad.Prompt
import XMonad.Prompt.Workspace
import XMonad.Prompt.XMonad
import XMonad.Actions.DynamicWorkspaces
import XMonad.Core
import Text.Read
import Data.List


import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "alacritty" -- set default terminal
myDmenu         = "dmenu_run -fn 'Fira Code Medium:size=15' -c -l 20 -i" -- font, center, lines, case-insensitive
myRofi          = "rofi -show combi"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False -- Change focus with clock other than hover

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth   = 2

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask  -- use the super key

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.

-- For xmobar
-- myWorkspaces    = ["\xf120 ","\xe62b ", "\xf7ae ","\xf27b ", "5 ", "6 ", "7 ", "8 ", "9 "]
myWorkspaces    = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
-- For polybar only defined an id, symbol can be defined in polybar config
-- myWorkspaces    = map show  [1..9]

-- Theme
myNormalBorderColor  = "#383c4a"
myFocusedBorderColor = "#5E81AC"
myActiveColor = "#404552"
myInActiveColor = "#383c4a"
myActiveTextColor = "#dddddd"
myInActiveTextColor = "#7f7f7f"
myFont = "xft:JetBrainsMono Nerd Font:size=12"

-- XPConfig (for xmonad promot)

-- similar to built-in selectWorkspace
-- but does not add the newworkspace if the name is not found
selectWorkspaceIfExist :: XPConfig -> X()
selectWorkspaceIfExist conf = workspacePrompt conf $ \w ->
                       do s <- gets windowset
                          if W.tagMember w s then windows $ W.greedyView w
                          else return ()
                            
isBasicWindowName :: String -> Bool
isBasicWindowName name = case (readMaybe name :: Maybe Int) of
    Nothing -> False
    Just i -> True

myXPConfig :: XPConfig
myXPConfig = def {
    position = CenteredAt 0.5 0.5
    ,height = 56
    ,font = myFont
    ,borderColor = myFocusedBorderColor
    ,bgColor = myInActiveColor
    ,bgHLight = myActiveColor
    ,fgColor = myActiveTextColor
    ,fgHLight = myFocusedBorderColor
    ,complCaseSensitivity  = CaseInSensitive
    ,sorter = (\x y -> filter (not . isBasicWindowName) y )         -- never show basic window in search result
}

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--

-- Helper function to detect current layout, in order for layout-specific bindings
-- I currently don't need it. Need more time to refresh my Haskell..
-- https://churchman.nl/2019/06/17/xmonad-per-layout-keybindings/
getCurrentLayout :: X String
getCurrentLayout = do
  workspaces <- gets windowset
  return $ description . W.layout . W.workspace . W.current $ workspaces

getCurrentScreenAsRectangle :: X Rectangle
getCurrentScreenAsRectangle = do
  workspaces <- gets windowset
  return $ screenRect . W.screenDetail . W.current $ workspaces

getCurrentScreenHeight = do
  rect <- getCurrentScreenAsRectangle
  return $ rect_height rect

getCurrentScreenWidth = do
  rect <- getCurrentScreenAsRectangle
  return $ rect_width rect


myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- Toggle docks (like xmobar).
    , ((modm,               xK_b     ), do sendMessage ToggleStruts
                                           toggleScreenSpacingEnabled
                                           toggleWindowSpacingEnabled
                                          )

    -- launch dmenu
    , ((modm,               xK_p     ), spawn myRofi)

    -- launch gmrun
    -- , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- launch screen capture.
    , ((modm,               xK_Print ), spawn "flameshot gui")

    -- launch ranger at home dir.
    -- Most of terminal should use -e flag to execute given command.
    -- class name used for hooker to identify it and float it rightaway
    , ((modm .|. shiftMask, xK_f ),     spawn $ myTerminal ++ " --class AlacrittyRanger -e ranger ~")

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

    -- Customize Xmonad prompt, allow me to add custmoize command in xmonad
    -- Such as renaming current workspace
    , ((modm .|. controlMask, xK_x), xmonadPrompt def)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), focusMaster  )

    -- Swap the focused window and the master window
    , ((modm,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area (width)
    , ((modm,               xK_Left     ), sendMessage Shrink)

    -- Expand the master area (width)
    , ((modm,               xK_Right     ), sendMessage Expand)

    -- Shrink the focused window (height)
    , ((modm,               xK_Down     ), sendMessage MirrorShrink)

    -- Expand the focused window (height)
    , ((modm,               xK_Up     ), sendMessage MirrorExpand)
  
    -- KeyBinding for tabbed, merge the windows in hjkl
    , ((modm .|. controlMask, xK_h), sendMessage $ pullGroup L)
    , ((modm .|. controlMask, xK_l), sendMessage $ pullGroup R)
    , ((modm .|. controlMask, xK_k), sendMessage $ pullGroup U)
    , ((modm .|. controlMask, xK_j), sendMessage $ pullGroup D)
    
    -- merge all / Unmerge the current windows.
    , ((modm .|. controlMask, xK_m), withFocused (sendMessage . MergeAll))
    , ((modm .|. controlMask, xK_u), withFocused (sendMessage . UnMerge))

    -- , . to switch prev / next tabs
    , ((modm,              xK_comma), onGroup W.focusUp')
    , ((modm,              xK_period), onGroup W.focusDown')

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    -- , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    -- , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Lock screen
    , ((modm .|. shiftMask .|. controlMask, xK_x     ), spawn "xscreensaver-command -lock")

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))

    -- switch workspace
    , ((modm .|. shiftMask, xK_p), selectWorkspaceIfExist myXPConfig)

    -- create workspace
    , ((modm .|. shiftMask, xK_bracketright), appendWorkspacePrompt myXPConfig)

    , ((modm .|. shiftMask, xK_d), removeEmptyWorkspace)
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
-- 1. Boring windows help to skip tabbed windows in tab layout.
--    The keybindings changes from W.movement to boringWindows.movement
--    Not sure if it going to bring any sub-effect...

myLayout = boringWindows (tiled ||| grid ||| magnifier_grid ||| tabbed ||| Mirror tiled ||| Full)
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = renamed [XMonad.Layout.Renamed.Replace "tall"] $ enableSpacing $  ResizableTall nmaster delta ratio []

     -- grid layout, usefull for putting skype, wechat, sportify ..
     grid    = renamed [XMonad.Layout.Renamed.Replace "grid"] $ enableSpacing $ GridRatio (16/10)

     -- grid with magnifier
     magnifier_grid    = renamed [XMonad.Layout.Renamed.Replace "magnified grid"] $ enableSpacing $ magnifier(GridRatio (16/10))

     -- tabbed layout, for reading pdfs..
     -- Put enableSpacing before addTabs so that tabbar size is correctly determined.
     tabbed  = renamed [XMonad.Layout.Renamed.Replace "tabs"] $  windowNavigation 
                  $ addTabs  shrinkText tab_config $ subLayout [] Simplest $ enableSpacing $ ResizableTall nmaster delta ratio []

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

     -- Spacing config
     enableSpacing = spacingRaw True (Border 12 6 6 6) True (Border 0 12 6 6) True

     -- Xmonad need to be restart to see effect.
     -- Mostly arc theme
     tab_config = def { 
                  activeColor = myActiveColor, inactiveColor = myInActiveColor,
                  activeBorderColor = myFocusedBorderColor, inactiveBorderColor = myNormalBorderColor,
                  activeTextColor = myActiveTextColor, inactiveTextColor = myInActiveTextColor,
                  fontName = "xft:JetBrainsMono Nerd Font:size=12",
                  decoHeight = 25
                  }


------------------------------------------------------------------------
-- Window rules:

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
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    -- Sound control
    , className =? "Pavucontrol"    --> doFloat
    -- Bluetooth control
    , resource =? "blueman-manager"    --> doFloat
    -- Network control
    , resource =? "nm-connection-editor"    --> doFloat
    -- File manager
    -- , resource =? "org.gnome.Nautilus"  --> doFloat
    , resource =? "pcmanfm"  --> doFloat
    -- , title =? "Raven Reader"          --> doShift (myWorkspaces !! 3)
    -- Ranger
    , resource =? "AlacrittyRanger"   --> doRectFloat (W.RationalRect 0.15 0.15 0.7 0.7)
    -- Wechat
    , className =? "Wine"   --> doFloat
    , className =? "wnr"   --> doRectFloat (W.RationalRect 0.3 0.3 0.3 0.3)
    , className =? "Wnr"   --> doRectFloat (W.RationalRect 0.3 0.3 0.3 0.3)
    -- Zoom
    -- , className =? "zoom"          --> doShift (myWorkspaces !! 3)
    -- Spotify not done. Xiaowen: Stupid spotify ignore ICCCM, don't know how to fix
    -- https://bbs.archlinux.org/viewtopic.php?id=204636
    --
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore 

    , className =? "Skype"          --> doCreateShift "skype"
    , className =? "Raven Reader"   --> doCreateShift "raven"
    , className =? "Slack"   --> doCreateShift "slack"
    , className =? "discord"   --> doCreateShift "discord"
    , className =? "Thunderbird"   --> doCreateShift "mail"
    , className =? "Zotero"   --> doCreateShift "zotero"
    , className =? "TelegramDesktop" --> doCreateShift "telegram"
    ]
    -- create a namespace and shift the application to that namespace
    where doCreateShift name = ask >>= \w -> (liftX $ addWorkspace name) >> (doShift name)

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--

-- this filter only prints basic name windows
windowNameFilter name = if (isBasicWindowName name) then name else ""
-- wrap window name and append space accordingly
smartWrap name = wrap newHead newTail name
    where 
      newHead = if (head name) == ' ' then "[" else "[ "
      newTail = if (last name) == ' ' then "]" else " ]"
          

myLogHook xmproc = dynamicLogWithPP xmobarPP
                  { ppOutput          = hPutStrLn xmproc
                  , ppTitle           = xmobarColor "#f8f8f2" "" . shorten 60
                  , ppCurrent         = xmobarColor "#8FBCBB" "" . smartWrap -- Current workspace in xmobar
                  , ppVisible         = xmobarColor "#8FBCBB " ""                 -- Visible but not current workspace
                  , ppHiddenNoWindows = windowNameFilter                         -- Show only basic 1-9 windows, hide app-specific window
                  , ppHidden          = windowNameFilter                         -- Show only basic 1-9 windows, hide app-specific window
                  , ppSep             = "<fc=#f8f8f2> : </fc>"                   -- Seperator and color
                  }

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
myStartupHook = do 
  -- polybar
  -- spawn "bash ~/.config/polybar/launch.sh"
  -- nitrogen a wallpaper mananger.
  spawn "nitrogen --restore &" 
  -- network applet
  spawnOnce "nm-applet &"
  -- bluetooth applet
  spawnOnce "blueman-applet &"
  -- fcitx applet
  -- spawnOnce "fcitx &"
  -- notification daemon
  spawnOnce "/usr/lib/notification-daemon-1.0/notification-daemon &"
  -- spawnOnce "pulseaudio --start"
  -- trayer, manage applet icons
  spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --transparent true --alpha 30 --tint 0x3b4252 --height 35 --iconspacing 4 &"

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = do 
  -- Start xmobar
  xmproc <- spawnPipe "xmobar /home/xiaowen/.config/xmobar/xmobarcc" 
  -- Run xmonad with setting
  xmonad $ ewmh $ docks def 
    {
        -- simple stuff
          terminal           = myTerminal ++ " -e tmux",
          focusFollowsMouse  = myFocusFollowsMouse,
          clickJustFocuses   = myClickJustFocuses,
          borderWidth        = myBorderWidth,
          modMask            = myModMask,
          workspaces         = myWorkspaces,
          normalBorderColor  = myNormalBorderColor,
          focusedBorderColor = myFocusedBorderColor,

        -- key bindings
          keys               = myKeys,
          mouseBindings      = myMouseBindings,

        -- hooks, layouts
          layoutHook         = avoidStruts myLayout,

          manageHook         = myManageHook <+> 
                               manageDocks, -- Manage dock appearance.

          handleEventHook    = myEventHook,

          logHook            = myLogHook xmproc,
          startupHook        = myStartupHook
      }

-------------------------------------------------------------------------
-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
