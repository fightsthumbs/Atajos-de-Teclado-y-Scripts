﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.





;Rename for CCK
^+F1::
Send,^a
Send,^x
Send, CCKampus_
Send, %clipboard%
Send,_%A_Year%%A_MM%%A_DD%
Send, {enter}
Return


<^>!F12::
Run, "G:\02 MCOP"
return

;<^>!F12::
;Run, F:\CCKAMPUS
;return 



::¿a::se despicha el audio
::¿pi::pausa innecesaria
::¿e::se equivoca
::¿gc::gallo claudio
::¿ts:: pausa para tragar saliva
::¿st::se traba
::¿eh::dice "eh"
::¿se::se enreda
::¿di::duda/inseguro


;AppsKey & {::
;send, MCOP
;Return



;escribir versión
;:O?:v1::(v1)
:?*:v1::(v1)
:?*:v2::(v2)
:?*:v3::(v3)
:?*:v4::(v4)
:?*:v5::(v5)
:?*:v6::(v6)
:?*:v7::(v7)
:?*:v8::(v8)
:?*:v9::(v9)