#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.





;;subrutina para remover los tooltips
RemoveToolTip:
ToolTip
return


^+F8:: 
Winset, Alwaysontop, , A ; Ctrl + Space
return

$AppsKey::Send, {AppsKey}
return

AppsKey & p::
MouseGetPos,x,y
PixelGetColor,rgb,x,y,RGB
StringTrimLeft,rgb,rgb,2
Clipboard=%rgb%
ToolTip, Color %rgb% copiado!
SetTimer, RemoveToolTip, -1500 ;;esto podría tambien ser un sleep y  después volver a poner un tooltip
Return


/* 
██████╗ ██████╗ ███████╗███╗   ███╗██╗███████╗██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝████╗ ████║██║██╔════╝██╔══██╗██╔════╝
██████╔╝██████╔╝█████╗  ██╔████╔██║██║█████╗  ██████╔╝█████╗  
██╔═══╝ ██╔══██╗██╔══╝  ██║╚██╔╝██║██║██╔══╝  ██╔══██╗██╔══╝  
██║     ██║  ██║███████╗██║ ╚═╝ ██║██║███████╗██║  ██║███████╗
╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
        */                                                       




#IfWinActive ahk_exe Adobe Premiere Pro.exe
;F3 para borrar el clip debajo del playhead
/* F3::
Send, d
Send, +{Delete}
return
 */
 
;Borrar clip solo
;XButton1::
^Mbutton::
send, ^{F1}
sleep, 50
send, ^{F3}
send, ^+a
send, v
send, {alt down}
send, {LButton}
send, {alt up}
send, {BackSpace}
return

; ;Captura de Pantalla
; ^MButton::
; ^!+F11
; return

;guardar still
+Mbutton::
Send, ^+e
send, {enter}
return

;In and Out for Work Area
<^>!i::
send,^+!9 ;asignar ctrl alt shift 9 en premiere
return


<^>!o::
send,^+!0 ;asignar ctrl alt shift 0 en premiere
return

;move playhead at cursor CTRL ALT SHIFT Right Click in Premiere
+RButton::
Click Middle
send,^+!|
return


;una función
 reproducirTimeline(mitecla)
{
    Click Middle ;pone focus en el timeline sobre el que esté el mouse
    send,^+!|
    sleep 50
    send %mitecla%
    return
}   

XButton1::
reproducirTimeline("l")
return

XButton2::
reproducirTimeline("j")
return
