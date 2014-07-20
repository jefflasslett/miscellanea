import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig( additionalKeys )

myConfig =
  defaultConfig { terminal = "sakura"
                , manageHook = manageDocks <+> manageHook defaultConfig
                , layoutHook = avoidStruts $ layoutHook defaultConfig
                } `additionalKeys`
                [ ( ( mod1Mask .|. controlMask, xK_m ), spawn "synclient TouchpadOff=0" )
                , ( ( mod1Mask .|. controlMask .|. shiftMask, xK_m ), spawn "synclient TouchpadOff=1" )
                , ( ( mod1Mask .|. controlMask, xK_t ), spawn "thunderbird" )
                , ( ( mod1Mask .|. controlMask, xK_f ), spawn "firefox" )
                ]

main = xmonad myConfig

