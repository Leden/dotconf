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
            , ((0, 0x1008FF11), spawn "amixer -D pulse -q sset Master 5%-") -- lower volume
            , ((0, 0x1008FF13), spawn "amixer -D pulse -q sset Master 5%+") -- raise volume
            , ((0, 0x1008FF41), spawn "slock") -- Lock screen
            , ((mod4Mask .|. mod1Mask, xK_F1), spawn "setxkbmap us") -- Win+AltL+F1: US keyb layout
            , ((mod4Mask .|. mod1Mask, xK_F2), spawn "setxkbmap ru") -- Win+AltL+F2: RU keyb layout
            , ((mod4Mask .|. mod1Mask, xK_F3), spawn "setxkbmap lt") -- Win+AltL+F3: LT keyb layout
            , ((mod4Mask .|. mod1Mask, xK_F4), spawn "setxkbmap 'us(altgr-intl)'") -- Win+AltL+F4: US-intl keyb layout
            , ((mod4Mask .|. mod1Mask, xK_h), spawn "xdotool mousemove_relative -- -10 0") -- Win+AltL+h: move mouse cursor left 10px
            , ((mod4Mask .|. mod1Mask, xK_j), spawn "xdotool mousemove_relative -- 0 10") -- Win+AltL+j: move mouse cursor down 10px
            , ((mod4Mask .|. mod1Mask, xK_k), spawn "xdotool mousemove_relative -- 0 -10") -- Win+AltL+k: move mouse cursor up 10px
            , ((mod4Mask .|. mod1Mask, xK_l), spawn "xdotool mousemove_relative -- 10 0") -- Win+AltL+l: move mouse cursor right 10px
            , ((mod4Mask .|. mod1Mask, xK_y), spawn "xdotool click --clearmodifiers 1") -- Win+AltL+y: mouse left-click
            , ((mod4Mask .|. mod1Mask, xK_u), spawn "xdotool click --clearmodifiers 2") -- Win+AltL+u: mouse middle-click
            , ((mod4Mask .|. mod1Mask, xK_i), spawn "xdotool click --clearmodifiers 3") -- Win+AltL+i: mouse right-click
            , ((mod4Mask .|. mod1Mask, xK_o), spawn "xdotool click --clearmodifiers 4") -- Win+AltL+o: mouse scroll up
            , ((mod4Mask .|. mod1Mask, xK_p), spawn "xdotool click --clearmodifiers 5") -- Win+AltL+p: mouse scroll down
            ]
