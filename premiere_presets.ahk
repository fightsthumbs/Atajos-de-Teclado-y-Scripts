#NoEnv
SendMode Input
;SetWorkingDir %A_ScriptDir%
;SetWorkingDir G:\AHK_Support_Files\

#IfWinActive ahk_exe Adobe Premiere Pro.exe



; Hotkey handler for applying presets (|)
$Launch_App2::
SendInput, '
Input, key, L1 T5, {Escape}{Enter}, abcdefghijklmnopqrstuvwxyz0123456789
    ;MsgBox, DEGUB %key% %iniFilePr% %presetSection% 
    if %key%
        SavePreset(key)
    else
        ; SendInput, |
return

$Launch_Mail::
Input, key, L1 T4, {Enter}, abcdefghijklmnopqrstuvwxyz0123456789
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


;;Agregar Capa de Ajuste 
Browser_Refresh::
media_add("Still Image Adjustment Layer")
return

Launch_App1::
media_add("Movie Bars and Tone - Rec 709")
return

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
    

!|::
marqueeSelect()
sendInput {F3}
sleep 50
sendInput ^+x
sleep 50
return


^|::
marqueeSelect()
return



marqueeSelect() {
ToolTip, Please marquee select an area to delete
; if key
; goto canceled
click_count = 0

KeyWait, LButton, D ; Wait for the left mouse button to be pressed down.
MouseGetPos, startxpos, startypos
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








#IfWinActive