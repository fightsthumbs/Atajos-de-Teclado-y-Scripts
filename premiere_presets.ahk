#NoEnv
SendMode Input
;SetWorkingDir %A_ScriptDir%
;SetWorkingDir G:\AHK_Support_Files\
/* 
██████╗ ██████╗ ███████╗███╗   ███╗██╗███████╗██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝████╗ ████║██║██╔════╝██╔══██╗██╔════╝
██████╔╝██████╔╝█████╗  ██╔████╔██║██║█████╗  ██████╔╝█████╗  
██╔═══╝ ██╔══██╗██╔══╝  ██║╚██╔╝██║██║██╔══╝  ██╔══██╗██╔══╝  
██║     ██║  ██║███████╗██║ ╚═╝ ██║██║███████╗██║  ██║███████╗
╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
*/        
#IfWinActive ahk_exe Adobe Premiere Pro.exe
#Include, %A_LineFile%\..\media_info.ahk ;; abrir información del archivo


; Hotkey handler for applying presets (|)
$Launch_App2:: ;Tecla Calculadora
tooltipAtMouse("Presiona una tecla para asignar el preset")
Input, key, L1 T5, {Escape}{Enter}, abcdefghijklmnopqrstuvwxyz0123456789,.-
    ;MsgBox, DEGUB %key% %iniFilePr% %presetSection% 
    if %key% {

        SavePreset(key)
        Sleep, 10
        tooltipAtMouse("tecla asignada".key)
    } else {
        ; SendInput, |
        return
    }
return

$Launch_Mail::
tooltipAtMouse("Añadir preset")
Input, key, L1 T4, {Enter}{Escape}, abcdefghijklmnopqrstuvwxyz0123456789,.-
if %key% {
    ApplyPreset(key)
} else {
    return
}

return




; Function to handle saving presets
SavePreset(key) {
    global iniFilePr
    global presetSection
; Esperar a que el usuario haga doble clic

MouseClick, middle
Sleep, 5
SendInput, ^{F6}
Sleep, 10
SendInput, +f
Sleep, 10
MouseMove, %A_CaretX%, %A_CaretY%, 0
Sleep, 15
SendInput, Presets{Enter}
Sleep, 20
SendInput, ñ

MouseGetPos, tooltipX, tooltipY
ToolTip, Double-click on the preset you want to save for key: %key%, %tooltipX%, %tooltipY%
;MsgBox, Double-click on the preset you want to save for key: %key%

; Esperar al doble clic y copiar el texto seleccionado
KeyWait, LButton, D
KeyWait, LButton
KeyWait, LButton, D T0.2
if !ErrorLevel
{
    ; Después del doble clic, copiar el texto seleccionado
    Sleep, 50  ; Pequeña pausa para asegurar que el texto esté seleccionado
    SendInput, ^c
    Sleep, 50  ; Pequeña pausa para asegurar que el texto se haya copiado
    send, {Escape}
    
    ; Obtener el texto del portapapeles
    presetName := Clipboard

    ToolTip

    if (presetName != "") {
        ; Guardar el preset en el archivo ini
        IniWrite, %presetName%, %iniFilePr%, %presetSection%, %key%_key_preset
        ToolTip, Preset "%presetName%" saved for key: %key%, %tooltipX%, %tooltipY%
        SetTimer, RemoveToolTip, -1000  ; El tooltip desaparecerá después de 1 segundo
    }
    else {
        ToolTip, No text was selected. Please try again., %tooltipX%, %tooltipY%
        SetTimer, RemoveToolTip, -1000
    }

    SendInput, ^{F5}
    MouseClick, middle

}
else {
    MsgBox, Double-click timeout. Please try again.
}
}

; Function to apply presets
ApplyPreset(key) {

    global iniFilePr
    global presetSection
    ; MsgBox, FunciónApplyPreset DEBUG - iniFilePr: %iniFilePr% presetSection: %presetSection%
    IniRead, presetName, %iniFilePr%, %presetSection%, %key%_key_preset
    ; MsgBox, %presetName%
    if (presetName = "ERROR" || presetName = "") {
        MsgBox, No preset found for key: %key%
        return
    }
    
        
    ; Store current mouse position

    BloquearInput() 
    
    ; Apply preset sequence
    MouseClick, middle
    Sleep, 5
    SendInput, ^{F6}
    Sleep, 10
    SendInput, +f
    Sleep, 10
    SendInput, ^a
    Sleep, 10
    SendInput, ^x
    Sleep, 10
    
    ; Move to caret position and send preset name
    MouseMove, %A_CaretX%, %A_CaretY%, 0
    Sleep, 5
    SendInput, %presetName%
    MouseMove, 13, 50, 0, R
    Sleep, 10
    
    ; Drag preset to original position
    MouseClickDrag, Left, , , %xposP%, %yposP%, 0
    Sleep, 5
    
    ; Reset view
    SendInput, ^{F5}
    MouseClick, middle

    DesbloquearInput()
}
    


BloquearInput() {
    MouseGetPos, xposP, yposP
    coordmode, pixel, screen
    coordmode, mouse, screen
    coordmode, Caret, screen
    ; Block input during preset application
    BlockInput, SendAndMouse
    BlockInput, MouseMove
    BlockInput, On
    
    Return
}

DesbloquearInput() {

    MouseMove, %xposP%, %yposP%
    ; Re-enable input
    BlockInput, MouseMoveOff
    BlockInput, off
    return
}

v::
send, v
Return

v & Space:: ;;minimizar tracks de video y volver v1 al primer track
send, ^!+{Home}
return

z::
send, z
Return

z & space:: ;;zoom en playhead
send, {NumpadDot}
Return


;;Agregar Capa de Ajuste 
~| & F1::
Browser_Refresh::
media_add("Still Image Adjustment Layer")
return

;;agregar bars and tones
~| & F2::
Launch_App1::
media_add("Movie Bars and Tone - Rec 709")
return

;; agregar capa de ajuste en la selección
~| & F3::
marqueeSelect()
sleep, 10
media_add("Still Image Adjustment Layer")
Return

;;agregar bars and tones en la selección
~| & F4::
marqueeSelect()
sleep,0
media_add("Movie Bars and Tone - Rec 709")
Return

;función agregar media
media_add(x) {
    BloquearInput()
    MouseClick, M
    SendInput, ^{F1}
    Sleep, 20
    SendInput, ^!+1
    Sleep, 50
    SendInput, +f 
    Sleep, 200
    MouseMove, %A_CaretX%, %A_CaretY%
    Sleep, 50
    SendInput, %x%
    Sleep,250
    SendInput,{Tab}{Esc}
    Sleep, 50
    SendInput, .
    Sleep, 50
    SendInput, +f {BackSpace}
    Sleep, 50
    DesbloquearInput()
    Return
}
    

;delete marquee
!|::
marqueeSelect()
sendInput {F3}
sleep 50
sendInput ^+x
sleep 50
return

;marquee
^|::
marqueeSelect()
return


;;funcion selectionar i and out with marquee
marqueeSelect() {
ToolTip, Please marquee select an area to delete
; if key
; goto canceled
click_count = 0


Loop {
    ; Si se presiona la tecla Esc, cancelar la selección
    if (GetKeyState("Esc", "P")) {
        goto canceled
    }

    ; Si se presiona el botón izquierdo del ratón, iniciar la selección
    if (GetKeyState("LButton", "P")) {
        MouseGetPos, startxpos, startypos
        break ; Salir del bucle principal
    }

    ; Pequeña pausa para evitar sobrecargar el procesador
    Sleep 10
}

KeyWait, LButton, U ; Wait for the left mouse button to be pressed down.
MouseGetPos, endxpos, endypos

If (startxpos == endxpos && startypos == endypos)
{
    goto canceled
}
else
{
    inXPos := endxpos > startxpos ? startxpos : endxpos
    outXPos := endxpos > startxpos ? endxpos : startxpos
    BloquearInput()
    sleep 25

    MouseMove, %inXPos%, %startypos%
    sleep 20
    sendInput ^+{x 2}
     sleep 10
    sendInput ^+{a 2}
    sleep 10
    sendInput ^+!|
    sleep 10
    sendInput i
    ; sendInput c
    sleep 25
    ; MouseMove, %endxpos%, %endypos%
    MouseMove, %outXPos%, %startypos%
    sleep 20
    sendInput ^+!|
    sleep 10
    sendInput o
     sleep 10
    sendInput ^+{a 2}
    sleep 10
    ;BlockInput, Off
    DesbloquearInput()
}
; clipboard = %AHKCommand%
ToolTip, exito!
SetTimer, RemoveToolTip, -1500
; MsgBox To simulate this click in AHK, use "%AHKCommand%" (This has been copied to your paste buffer). This script will exit after you dismiss this message.
return

canceled:
ToolTip, Canceled!
SetTimer, RemoveToolTip, -1500
return
}


;F3 para borrar el clip debajo del playhead
/* F3::
Send, d
Send, +{Delete}
return
 */
 
;Borrar clip solo
;XButton1::

^Mbutton:: ;eliminar solo fragmento o eliminar corte de un clip
MouseClick, Middle
MouseClick, Middle
sleep, 50
send, ^+a
send, v
send, {alt down}
send, {LButton}
send, {alt up}
send, {delete}
return

;guardar still
+Mbutton::
Send, ^+e
send, {enter}
return

/* 
;In and Out for Work Area
<^>!i::
send,^+!9 ;asignar ctrl alt shift 9 en premiere
return


<^>!o::
send,^+!0 ;asignar ctrl alt shift 0 en premiere
return
 */


;move playhead at cursor CTRL ALT SHIFT Right Click in Premiere
+RButton::
Click Middle
send,^+!|
return


;una función que reproduce el timeline
 reproducirTimeline(mitecla,veces:=1)
{
    Click Middle ;pone focus en el timeline sobre el que esté el mouse
    send,^+!|
    sleep 15
    Loop %veces%
{
    send {%mitecla%}  ; Auto-repeat consists of consecutive down-events (with no up-events).
    Sleep 10  ; The number of milliseconds between keystrokes (or use SetKeyDelay).
}
    
    return
}   

*XButton1::
    if !GetKeyState("Shift") {
        reproducirTimeline("l")
        return  
    }
    else {
        reproducirTimeline("l", "2")
        Return
    }
return

; +XButton1::
;     reproducirTimeline("l","2")  
; return

*XButton2::
    if !GetKeyState("Shift") {
        reproducirTimeline("j")
        return  
    }
    else {
        reproducirTimeline("j", "2")
        Return
    }
return


!RButton::
MouseClick, Middle
if GetKeyState("LAlt", "P") = 1
		{
		loop
	{
			Send ^+!| ;in premiere, this must be set to "move playhead to cursor."
			;Tooltip, button 5 playhead mod!
			sleep 16 ;this loop will repeat every 16 milliseconds.
			if GetKeyState("RButton", "P") = 0
				{
				;msgbox,,,time to break,1
				;tooltip,   
                MouseClick, Right
                send, {Esc} 
                send, ^+a
                return
				; goto theEnd2
				; break
				}
			}
}
theEnd2:
MouseClick, middle
Return







^!+F1::
send,^!{F6}
send, ^k
send,^!{F6 3} 
send, q
return

;#Include, D:\Documentos\AutoHotKey Scripts\Premiere Presets.ahk



/* 
Launch_Media::
send, ^e
return
 */



;mover mouse
;ControlGetPos, xPosMouse, yPosMouse,w, h, 
/* +!j::
MouseGetPos, xpos, ypos
sleep, 5
MsgBox, "The cursor is at X%xpos% Y%ypos%."
return 
*/

/* 
preset(x)
{
KeyWait, %A_PriorHotkey%

IfWinNotActive ahk_exe Adobe Premiere Pro.exe
    Goto, Ending

CoordMode, pixel, window
CoordMode, mouse, window
CoordMode, Caret, Window

BlockInput, SendAndMouse
Blockinput, MouseMove
BlockInput, On

SetKeyDelay, 0

sendInput, k
Sleep 10
sendInput, k

MouseGetPos, xposP, yposP
sendInput, {MButton}
sleep 5
Send, ^F6
sendInput, +f

;Any text in the Effects panel's find box has now been highlighted. There is also a blinking "text insertion point" at the end of that text. This is the vertical blinking line, or "caret."  
if (A_CaretX = "")
{
;No Caret (blinking vertical line) can be found.
waiting2 = 0
;the following loop is waiting until it sees the caret. SUPER IMPORTANT. Without this, the function doesn't work 10% of the time.
;This is also way better than just always waiting 60 milliseconds like it had been before. The function can continue as soon as Premiere is ready.
loop
	{
	waiting2 ++
	sleep 33
	tooltip, counter = (%waiting2% * 33)`nCaret = %A_CaretX%
	if (A_CaretX <> "")
		{
		tooltip, CARET WAS FOUND
		break
		}
	if (waiting2 > 30)
		{
		tooltip, FAIL - no caret found. `nIf your cursor will not move`, hit the button to call the preset() function again.`nTo remove this tooltip`, refresh the script using its icon in the taskbar.
		;Note to self, need much better way to debug this than screwing the user
		sleep 200
		;tooltip,
		GOTO theEnding
		;lol, are you triggered by this GOTO? lolol lololol
		}
	}
sleep 1
tooltip,

MouseMove, %A_CaretX%, %A_CaretY%, 0
sleep 5



}
    
    
    
    } */

 */




#IfWinActive