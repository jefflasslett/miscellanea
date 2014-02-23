import XMonad
import XMonad.Hooks.ManageDocks

myConfig =
  defaultConfig { terminal = "sakura"
                , manageHook = manageDocks <+> manageHook defaultConfig
                , layoutHook = avoidStruts $ layoutHook defaultConfig
                }

main = xmonad myConfig

