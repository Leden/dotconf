import           System.IO
import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Util.EZConfig     (additionalKeys)
import           XMonad.Util.Run          (spawnPipe)


main = do
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
            , ((0, 0x1008FF11), spawn "amixer -q sset Master 5%-") -- lower volume
            , ((0, 0x1008FF13), spawn "amixer -q sset Master 5%+") -- raise volume
            , ((0, 0x1008FF41), spawn "slock") -- Lock screen
            ]
