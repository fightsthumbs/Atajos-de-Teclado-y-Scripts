#SingleInstance, Force
SendMode Input
; SetWorkingDir, %A_ScriptDir%

;;Credits to constellations-sco

#^v::
temp = %Clipboard%
temp := RegExReplace(temp, "({a-z])-{`r`n]+", "$1")
StringReplace, temp, temp, `r,,All
StringReplace, temp, temp, `n,%A_SPACE%, All
Clipboard = %temp%
Send ^v

return