#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#IfWinActive, ahk_class Notepad
;Numpad5 & j::
;Send, me parece extraordinario
;MsgBox, LOL
;Return


/* #IfWinActive
Numpad5 & c::
WinGetClass, class, A
MsgBox, The active window's class is "%class%".
Return

:*:acheiv::achiev
::achievment::achievement
::acquaintence::acquaintance
:*:adquir::acquir
::aquisition::acquisition
:*:agravat::aggravat
:*:allign::align
::ameria::America */

;#IfWinActive
;:*:ftw::Free the whales
;::ftw::"For the win"

/* #IfWinActive, Spotify Free
Numpad5 & s::
MsgBox, Este mensaje solo aparece al apretar 5 + s en spotify
Return

#IfWinActive, 
Numpad5 & y::
Run, https://www.youtube.com
Return
 */
^+F10::
Run, https://docs.google.com/spreadsheets/d/1fLjBlydZqBI3BuLHNnAzKuXc9KiibazEfixZzxz-WSY/edit?usp=sharing
Return

^+F11::
Run, https://docs.google.com/forms/d/e/1FAIpQLSfPFDuwvwIOV6xOKztveLyE_1Uzk6mkYs0ZvIsLnkE_xdvGLQ/viewform
Return

/* Numpad5 & n::
Run, C:\Users\XPC\AppData\Local\Programs\Notion\Notion.exe
;Send, ^+n
Return

Numpad5 & b::
Run, D:\Archivos de Programas\Blender\blender.exe
Return

Numpad5 & e::
Run, D:\Archivos de Programas\Everything\Everything.exe
Return
 */

;este rellena los campos de la boleta de horas conferencia

;miNombre := "Benjamín Álvarez Rodríguez"
;miCorreo := "benjamin.alvarez@ucr.ac.cr"
;miCarnet := "B60401"

^+F12::
;day = FormatTime, CurrentDateTime,, dd
;mes = FormatTime, CurrentDateTime,, MM
;year = FormatTime, CurrentDateTime,, yyyy

;listita = [global%miNombre%,%miCorreo%,%miCarnet%]
miNombre := "Benjamín Álvarez Rodríguez"
miCorreo := "benjamin.alvarez@ucr.ac.cr"
miCarnet := "B60401"
send %miCorreo%
send,{tab}
send %miNombre%
send,{tab}
send %miCarnet%
send,{tab}
send,{tab}%A_DD%
send,{tab}%A_MM%
send,{tab}%A_YYYY%
Return


/*
Numpad1 & n::
Send, %miNombre%
Return

Numpad1 & e::
Send, %miCorreo%
Return

Numpad1 & c::
Send, %miCarnet%
Return
*/



:*:@fg::fightsthumbs@gmail.com
:*:@bb::benisbuying@gmail.com
:*:@fp::ficcionpulpa@yahoo.com
:*:@ba::balvarez@cckcentroamerica.com

;escribir versión
:O?:v1::(v1)
:?*:v2::(v2)
:?*:v3::(v3)
:?*:v4::(v4)
:?*:v5::(v5)
:?*:v6::(v6)
:?*:v7::(v7)
:?*:v8::(v8)
:?*:v9::(v9)


; Buscar texto seleccionado en google
^+F5::
{
 Send, ^c
 Sleep 50
 RunWait, https://www.ecosia.org/search?q=%clipboard%
 Return
}


; Subir o Bajar volumen
+NumpadAdd:: Send {Volume_Up} ;shift + +
+NumpadSub:: Send {Volume_Down} ;shift + -
break::Send {Volume_Mute} ; Br*eak key mutes
return

^+F3::
Run, D:\Archivos de Programas\Everything\Everything.exe
Return

^+F4::
Run, "D:\Archivos de Programas\BRU_NoInstall\64-bit\Bulk Rename Utility.exe"
return

;Rename for CCK
^+F1::
Send,^a
Send,^x
Send, CCKampus_
Send, %clipboard%
Send,_%A_Year%%A_MM%%A_DD%
Send, {enter}
Return


;Alt Tab Derecho 
Ctrl & }::AltTab
return

;Hacer que una ventana esté siempre encima de las demás Ctrl + Shift + F8
 ^+F8:: Winset, Alwaysontop, , A ; Ctrl + Space
 return

^+F7::
MsgBox, %A_Year%%A_MM%%A_DD%
MsgBox, %clipboard%
Run, notepad.exe
WinActivate, Untitled - Notepad
WinWaitActive, Untitled - Notepad
Send, %A_Year%%A_MM%%A_DD%
SendInput, %clipboard%.
return


#IfWinActive ahk_exe Adobe Premiere Pro.exe
;F3 para borrar el clip debajo del playhead
F3::
Send, d
Send, +{Delete}
return

;Borrar clip solo
;XButton1::
^Mbutton::
send, ^F1
sleep, 50
send, ^F3
send, ^+a
send, v
send, {alt down}
send, {LButton}
send, {alt up}
send, {delete}
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

