#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;listita = [global%miNombre%,%miCorreo%,%miCarnet%]
miNombre := "Benjamín Álvarez Rodríguez"
miCorreo := "benjamin.alvarez@ucr.ac.cr"
miCarnet := "B60401"

FormatTime, var, %A_Now%, dd 'de' MMMM


;escribe el dia y el mes
::fechahoy::
FormatTime, todaysDate, %A_Now%, dd 'de' MMMM
sendInput, %todaysDate%
return

:*:|name::
SendInput, Benjamín Álvarez Rodríguez
return


::|ced::117100635
::|phone::84926888
::|user::fightsthumbs



:*:@temp::temp@fightsthumbs.anonaddy.com
:*:@spam::spam@fightsthumbs.anonaddy.com
:*:.fg.::fightsthumbs
:*:@fg::fightsthumbs@gmail.com
:*:@bb::benisbuying@gmail.com
:*:@fp::ficcionpulpa@yahoo.com
:*:@ba::balvarez@cckcentroamerica.com
:*:@uccc::benjamin.alvarez@ucr.ac.cr


:*:--{Left}::→
:*:<--::←
:*:<-->::↔
:*:c//::₡ ;"ALT + 198"
:*:|pi::π
:*:|cr::🇨🇷
:*:|im::🇮🇲


:*:|cc::CCKampus

;§
;≈
;¤∵∴∵∓∞※±⁂‡




AppsKey & Ins::
;este rellena los campos de la boleta de horas conferencia

;miNombre := "Benjamín Álvarez Rodríguez"
;miCorreo := "benjamin.alvarez@ucr.ac.cr"
;miCarnet := "B60401"


;day = FormatTime, CurrentDateTime,, dd
;mes = FormatTime, CurrentDateTime,, MM
;year = FormatTime, CurrentDateTime,, yyyy


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