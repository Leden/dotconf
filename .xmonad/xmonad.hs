import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


main = do
    -- trayerproc <- spawnPipe "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x191970 --height 12"
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { borderWidth = 1
        , normalBorderColor = "#333333"
        , focusedBorderColor = "#6a47d1"
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#7de87d" "" . shorten 80
                        }
        , modMask = mod4Mask -- Win/Super key
        } `additionalKeys`
            [ ((0, 0x1008FF12), spawn "amixer -D pulse set Master toggle") -- toggle mute
            , ((0, 0x1008FFB2), spawn "amixer set Capture toggle") -- toggle mic mute
            , ((0, 0x1008FF11), spawn "amixer -q sset Master 2%-") -- lower volume
            , ((0, 0x1008FF13), spawn "amixer -q sset Master 2%+") -- raise volume
            , ((0, 0x1008FF41), spawn "slock") -- Lock screen
            ]
