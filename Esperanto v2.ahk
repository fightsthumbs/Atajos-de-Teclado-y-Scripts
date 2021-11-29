#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


/*
RAlt::
send, {RAlt}
return
*/

RAlt & g::  
    if GetKeyState("Shift", "P") ^ GetKeyState("CapsLock", "T") ;^ indica que alguna de las dos condiciones debe ser verdadera, pero solo una.
        send Ĝ  
    else  
    send ĝ  
return  
 
RAlt & c::  
    if GetKeyState("Shift", "P") ^ GetKeyState("CapsLock", "T")  
        send Ĉ  
    else  
    send ĉ  
return  
 
RAlt & J::  
    if GetKeyState("Shift", "P") ^ GetKeyState("CapsLock", "T")  
        send Ĵ  
    else  
    send ĵ  
return
 
RAlt & H::  
    if GetKeyState("Shift", "P") ^ GetKeyState("CapsLock", "T")  
        send Ĥ  
    else  
    send ĥ  
return  
 
RAlt & S::  
    if GetKeyState("Shift", "P") ^ GetKeyState("CapsLock", "T")  
        send Ŝ  
    else  
    send ŝ  
return  
 
RAlt & U::  
    if GetKeyState("Shift", "P") ^ GetKeyState("CapsLock", "T")  
        send Ŭ  
    else  
    send ŭ  
return