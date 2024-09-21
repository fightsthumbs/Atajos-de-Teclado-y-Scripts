#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#IfWinActive ahk_class Premiere Pro
!+e::
Clipboard =
Send, ^!f

;sleep, 1
WinWaitActive, ahk_class dopus.lister,, 1
if ErrorLevel
    {
        MsgBox, WinWait timed out.
        return
    }
    else
sleep, 400
Send, +^c
ClipWait, 1
RunWait, "C:\Program Files\MediaInfo\MediaInfo.exe" "%Clipboard%"

Return
