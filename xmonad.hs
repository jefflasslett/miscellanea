import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig( additionalKeys )

myManageHook = composeAll
   [ className =? "gimp"  --> doFloat
   , manageDocks
   ]

myConfig =
  docks $ def { terminal = "urxvt"
              , manageHook = myManageHook <+> manageHook def
              , layoutHook = avoidStruts $ layoutHook def
              , handleEventHook = docksEventHook <+> handleEventHook def
              } `additionalKeys`
              [ ( ( mod1Mask .|. controlMask, xK_m ), spawn "synclient TouchpadOff=0" )
              , ( ( mod1Mask .|. controlMask .|. shiftMask, xK_m ), spawn "synclient TouchpadOff=1" )
              , ( ( mod1Mask .|. shiftMask, xK_4 ), spawn "scrot -s" )
              , ( ( mod1Mask .|. controlMask, xK_t ), spawn "thunderbird" )
              , ( ( mod1Mask .|. controlMask, xK_f ), spawn "firefox" )
              , ( ( mod1Mask .|. controlMask, xK_l ), spawn "slock" )
              ]

main = xmonad $ docks myConfig

