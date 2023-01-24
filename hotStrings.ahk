#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FormatTime, var, %A_Now%, dd 'de' MMMM


;escribe el dia y el mes
::fechahoy::
FormatTime, todaysDate, %A_Now%, dd 'de' MMMM
sendInput, %todaysDate%
return

:*:|isodate::
:*:|today::
FormatTime, todaysDate, %A_Now%, yyyyMMdd
sendInput, %todaysDate%
return


:*:--{Left}::→
:*:<--::←
:*:<-->::↔
:*:c//::₡ ;"ALT + 198"
:*:e//::€
:*:|copyr::©
:*:|pi::π
:*:|cr::🇨🇷
:*:|im::🇮🇲
:?*:|par::§

;§
;≈
;¤∵∴∵∓∞※±⁂‡


;escribir versión
;:O?:v1::(v1)
:?*:|v1::_v1_
:?*:|v2::_v2_
:?*:|v3::_v3_
:?*:|v4::_v4_
:?*:|v5::_v5_
:?*:|v6::_v6_
:?*:|v7::_v7_
:?*:|v8::_v8_
:?*:|v9::_v9_