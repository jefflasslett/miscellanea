import XMonad


myConfig =
  defaultConfig { terminal = tmux }
               

main = xmonad myConfig

