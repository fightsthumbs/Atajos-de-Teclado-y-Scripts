#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;#IfWinActive ahk_class Premiere Pro


e::
send, e
return

!+e::
    goCopyFilePath()
    RunWait, "C:\Program Files\MediaInfo\MediaInfo.exe" "%Clipboard%"
    sleep, 50
Return

~e & space::
    goCopyFilePath()
    FilePath := Clipboard
    infoToGet := """General;%File_Created_Date%"""
    mediaInfoCommand := "mediainfo --Language=raw --Full --inform=" . infoToGet . " """ . FilePath . """"
    sleep, 50
    executeCommand(mediaInfoCommand)
Return



goCopyFilePath() {
    Clipboard =
    Send, ^!f
    sleep, 10
    WinWaitActive, ahk_class dopus.lister,, 1
    if ErrorLevel
        {
            MsgBox, WinWait timed out.
            return
        }
        else
    sleep, 500
    Send, +^c
    ClipWait, 1
    }

executeCommand(x) {
    Command := x
    ; Redirecciona la salida a un archivo temporal
    TempFile := A_Temp . "\\output.txt"
    RunWait, %ComSpec% /C %Command% > "%TempFile%",, Hide

    ; Lee el contenido del archivo temporal
    FileRead, Output, %TempFile%
    Clipboard := Output

    ; Muestra el resultado en un MsgBox
    MsgBox, % "Resultado del comando:`n" . Output . "`n copiado al Portapapeles"

    ; Elimina el archivo temporal
    FileDelete, %TempFile%

    return
}