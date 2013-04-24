import Yi
import Yi.Keymap.Vim 
import qualified Yi.Mode.Haskell as Haskell
import Yi.Style
import Yi.Style.Library
import Yi.Prelude
-- import Yi.FuzzyOpen ( fuzzyOpen )
import Yi.Hoogle
import Prelude ()

import Data.Monoid ( mappend ) -- Used in theme style definitions

-- import Yi.UI.Vty (start)
-- import Yi.UI.Cocoa (start)
-- import Yi.UI.Pango (start)

-- Uncomment for Shim support
-- import qualified Yi.Mode.Shim as Shim
-- -- Shim.minorMode gives us emacs-like keybindings - what would be a good
-- -- set of keybindings for vim?
-- shimMode :: AnyMode
-- shimMode = AnyMode (Shim.minorMode Haskell.cleverMode)

myTheme =
  defaultLightTheme `override` \super _ -> super
    { modelineAttributes = emptyAttributes { foreground = white, background = grey, bold = True }
    , tabBarAttributes = emptyAttributes { foreground = white, background = black }
    , baseAttributes = emptyAttributes { foreground = white }
    , commentStyle = withFg green `mappend` withItlc True 
    , blockCommentStyle = withFg green `mappend` withItlc True 
    , selectedStyle = withReverse True
    , errorStyle = withFg white `mappend` withBg red 
    , operatorStyle = withFg brightwhite `mappend` withBd True
    , importStyle = withFg purple `mappend` withBd True
    , dataConstructorStyle = withFg yellow
    , typeStyle = withFg cyan `mappend` withBd True
    , keywordStyle = withFg blue `mappend` withBd True
    , builtinStyle = withFg brown `mappend` withBd True
    , stringStyle = withFg red `mappend` withBd True
    , numberStyle = withFg red `mappend` withBd True
    , preprocessorStyle = withFg magenta
    }


myConfigUI :: UIConfig
myConfigUI = (configUI defaultVimConfig)  { configFontSize = Just 10
                                          , configTheme = myTheme
                                          , configWindowFill = '~'
                                          }

myKeymap =
  mkKeymap $ defKeymap `override` \super self ->super
    { v_top_level =
        (deprioritize >> v_top_level super)
        <|> (ctrlCh 'p' ?>>! hoogle)
        <|> (ctrlCh 'h' ?>>! hoogleSearch)
        <|> (ctrlCh 'i' ?>>! hoogleSearch)
        <|> (char ';' ?>>! resetRegexE)
    }

main :: IO ()
main = yi $ defaultVimConfig {
    -- Uncomment for Shim support
    -- modeTable = [shimMode] <|> modeTable defaultVimConfig,
    configUI = myConfigUI
  , defaultKm = myKeymap
  }
