#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


shutdown(x) {
    msgbox, Tu computadora se apagará en %A_ThisLabel%.`r`nPrepárate!
    MsgBox, %MyEdit%
    RunWait, shutdown /a
    sleep, 16
    RunWait, shutdown /s /t %x%
    Gui, Destroy
    return
}


shutdownTimer:
; Menu, Tray, Icon, C:\WINDOWS\system32\shell32.dll,216 ;Set custom Script icon
Gui, Add, Text, x12 y9 w330 h30 , Es hora de apagar. Por favor indica un tiempo para apagar el computador
Gui, Add, Button, x7 y44 w60 h50 g1m , 1min
Gui, Add, Button, x77 y44 w60 h50 g3m, 3min
Gui, Add, Button, x147 y44 w60 h50 g5m, 5min
Gui, Add, Button, x217 y44 w60 h50 g10m, 10min
Gui, Add, Button, x287 y44 w60 h50 g15m, 15min
Gui, Add, Button, x7 y114 w60 h50 g30m, 30min
Gui, Add, Button, x77 y114 w60 h50 g45m, 45min
Gui, Add, Button, x217 y114 w60 h50 g2h, 2h
Gui, Add, Button, x147 y114 w60 h50 g1h, 1h
Gui, Add, Button, x287 y114 w60 h50 g4h, 4h
Gui, Add, Button, x7 y184 w350 h40 gCancel, Cancelar Apagado
Gui, Add, CheckBox, vMyEdit Checked0 x12 y229 w350 h30 vMyEdit gRestart, Do you want to Restart?

; Generated using SmartGUI Creator 4.0
Gui, Show, x292 y288 h279 w375, Shutdown Timer
Return



1m:
shutdown(60)
return

3m:
shutdown(60*3)
return

5m:
shutdown(60*5)
return


10m:
shutdown(60*10)
return


15m:
shutdown(60*15)
return


30m:
shutdown(60*30)
return


45m:
shutdown(60*45)
return


1h:
shutdown(1*60*60)
return


2h:
shutdown(2*60*60)
return


4h:
    if (MyEdit > 0) {
        MsgBox, myedit=1
    } else {
shutdown(4*60*60)

    }
return

Restart:
MsgBox, Hello %MyEdit%
return



Cancel:
; Menu, Tray, NoIcon

;
MsgBox, %MyEdit% Hello
;

RunWait, shutdown /a
Gui, Destroy
return

; GuiClose:
; ExitApp