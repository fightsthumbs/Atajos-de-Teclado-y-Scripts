#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



/* 
 ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗     
██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║     
██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║     
██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║     
╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗
 ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
     */  

;;subrutina para remover los tooltips
RemoveToolTip:
ToolTip
return

;;funcion historial de búsqueda
func_myHistory(termino, action) {
    SetWorkingDir, D:\
    archivo := FileOpen("AHK_history.csv", "a")
    ;;InputBox, var_mensaje, Title, Prompt
    FormatTime, var_fechayhora,, yyyyMMdd-HH:mm:ss
    archivo.Write("`r`n" var_fechayhora "; " action ";" termino)
    archivo.Close()
    SetWorkingDir %A_ScriptDir%
    Return
}

;;función para interar entre varias intancias de un mismo programa
flashOpen(nombre, exe) {

    IfWinNotExist, %nombre%
    {
        run, %exe%
        return
    } else {
        WinActivateBottom, %nombre%
        return
    }
}

/* 
flashOpen(nombre, exe) {
    groupName:= %exe% . _group
    sleep 11 ;this is to avoid the stuck modifiers bug
    IfWinNotExist, %nombre% ;;ahk_class CabinetWClass
        Run, %exe% ;;explorer.exe
    GroupAdd, groupName, %nombre%
    prog:= ahk_exe  . %exe%
    
    if WinActive(prog) ;;"ahk_exe explorer.exe" esto se debe cambiar por el sistema de explorador de archivos
        GroupActivate, groupName, r
    else
        WinActivate %nombre% ;you have to use WinActivatebottom if you didn't create a window group.

    return
}
 */


passwordAssist(x) {
    passwordAssist_Alfabet := "abcdefghijklmnñopqrstuvwxyz" ;todo el alfabeto
    passwordAssist_vocales := "aeiou" ;todas las vocales
    passwordAssist_key := 0 ;
    sitio := x
    firstLetter := SubStr(x, 1, 1)
    secondLetter := SubStr(x, 2, 1)
    lastLetter := SubStr(x, 0)
    passwordAssist_SpecialChar := ",.,."

    StringGetPos, LetterIndex, passwordAssist_Alfabet, %firstLetter%
    StringGetPos, nDelimeter, passwordAssist_Alfabet, n
    ;StringGetPos, OutputVar, InputVar, SearchText [, L#|R#, Offset]

    if (LetterIndex < nDelimeter + 1) {
        passwordAssist_key := "QWE"
    } else {
        passwordAssist_key := "ASD"
    }
        
    IfInString, passwordAssist_vocales, %secondLetter%
    {
        even := "246"
    } else {
        even := "357"
    }
        

    IfInString, passwordAssist_vocales, %lastLetter% 
    {
        bn := "ntrs" 
    } else {
        bn := "brea"
    }
        

    ;con := x[0].x[-1].passwordAssist_key.passwordAssist_SpecialChar.even.bn
    ;MsgBox %bn%
    sleep 30
    send % firstLetter lastLetter passwordAssist_key passwordAssist_SpecialChar even bn
    return
    
}




;ScriptEnd



/* #IfWinActive
Numpad5 & c::
WinGetClass, class, A
MsgBox, The active window's class is "%class%".
Return

/* #IfWinActive, Spotify Free
Numpad5 & s::
MsgBox, Este mensaje solo aparece al apretar 5 + s en spotify
Return

#IfWinActive, 
Numpad5 & y::
Run, https://www.youtube.com
Return
 */


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



;escribe el dia y el mes
::fechahoy::
FormatTime, todaysDate, %A_Now%, dd 'de' MMMM
send, %todaysDate%
return

::%name::Benjamín
::%ced::1-1710-0635

:*:@temp::temp@fightsthumbs.anonaddy.com
:*:@spam::spam@fightsthumbs.anonaddy.com
:*:.fg.::fightsthumbs
:*:@fg::fightsthumbs@gmail.com
:*:@bb::benisbuying@gmail.com
:*:@fp::ficcionpulpa@yahoo.com
:*:@ba::balvarez@cckcentroamerica.com
:*:@uccc::benjamin.alvarez@ucr.ac.cr



/*
 / \-------------------, 
 \_,|                  | 
    |    Windows KEY   | 
    |  ,-----------------
    \_/________________/ 
*/
/*
LWin  <#
RWin   >#
*/

$LWin::Send, {LWin}
return


LWin & F1::
ToolTip You pressed %A_ThisHotkey%.
SetTimer, RemoveToolTip, -1500
return

LWin & F2::
ToolTip You pressed %A_ThisHotkey%.
SetTimer, RemoveToolTip, -1500
return

LWin & F3::
ToolTip You pressed %A_ThisHotkey%.
SetTimer, RemoveToolTip, -1500
return

LWin & F4::
ToolTip You pressed %A_ThisHotkey%.
SetTimer, RemoveToolTip, -1500
return

LWin & F5::
ToolTip You pressed %A_ThisHotkey%.
SetTimer, RemoveToolTip, -1500
return


LWin & F6::
FileSelectFolder, OutputVar, , 3
if OutputVar =
    MsgBox, You didn't select a folder.
else
    MsgBox, You selected folder "%OutputVar%".
return

LWin & F7::
return



transToggle	:= 0
return

LWin & Browser_Home::
LWin & MButton::
	; This is where the toggling occurs. You're setting the toggle to the opposite of itself.
	; 1 becomes 0. True becomes False. You can use either.
	transToggle	:= !transToggle

	if (transToggle = 0){
		; If the toggle is off (0 or false), do the stuff in here
		WinSet, Transparent, 120, A
	}
	else{
		; If the toggle is on (1 or true), do the stuff in here
		WinSet, Transparent, Off, A
	}

return






/*
LWin & Browser_Home::
LWin & MButton::
;Winset, Alwaysontop, , A ; Ctrl + Space 
WinSet, Transparent, 30, A
return

LWin & RButton::
;Winset, Alwaysontop, , A ; Ctrl + Space 
WinSet, Transparent, Off, A
return
*/




/* 
 / \------------------, 
 \_,|                 | 
    |    CTRL SHIFT   | 
    |  ,----------------
    \_/_______________/ 
*/                   
                                                                      






; Buscar texto seleccionado en google
^+F3::
Run, D:\Archivos de Programas\Everything\Everything.exe
Return

^+F4::
;Run, "D:\Archivos de Programas\BRU_NoInstall\64-bit\Bulk Rename Utility.exe"
Run, "C:\Program Files\Bulk Rename Utility\Bulk Rename Utility.exe"
return

;Buscar en Ecosia el texto seleccionado
^+F5::
{
 Send, ^c
 Sleep 50
 RunWait, https://www.ecosia.org/search?q=%clipboard%
 Return
}

;Abrir bloc de notas
^+F7::
Run, notepad.exe
WinActivate, Untitled - Notepad
WinWaitActive, Untitled - Notepad
return

;Hacer que una ventana esté siempre encima de las demás Ctrl + Shift + F8

^+F8:: 
Winset, Alwaysontop, , A ; Ctrl + Space
return
/* 
^+F9::
;https://www.wordreference.com/definicion/exhortar
InputBox, buscarDefinicion, Palabra, Escribe una palabra para buscar su significado,,,,,,, 40, paralelepípedo
Sleep 50
RunWait, https://www.wordreference.com/definicion/%buscarDefinicion%
return
 */

^+F10::
Run, https://docs.google.com/spreadsheets/d/1fLjBlydZqBI3BuLHNnAzKuXc9KiibazEfixZzxz-WSY/edit?usp=sharing
Return

^+F11::
Run, https://docs.google.com/forms/d/e/1FAIpQLSfPFDuwvwIOV6xOKztveLyE_1Uzk6mkYs0ZvIsLnkE_xdvGLQ/viewform
Return


; Subir o Bajar volumen
+NumpadAdd:: Send {Volume_Up} ;shift + +
+NumpadSub:: Send {Volume_Down} ;shift + -
break::Send {Volume_Mute} ; Br*eak key mutes
return


/* 
 / \----------------, 
 \_,|               | 
    |    AppsKeys   | 
    |  ,--------------
    \_/_____________/ 
 */


;esto permite que la tecla sola siga funcionando
$AppsKey::Send, {AppsKey}
return

;;ESTA LINEA SE PUEDE BORRAR, SOLO SIRVE PARA CCKAMPUS
AppsKey & {::
send, MCOP
Return


;cambiar entre las ventanas de explorador
AppsKey & -::
sleep 11 ;this is to avoid the stuck modifiers bug
IfWinNotExist, ahk_class dopus.lister ;;ahk_class CabinetWClass
	Run, dopus.exe ;;explorer.exe
GroupAdd, taranexplorers, ahk_class dopus.lister
if WinActive("ahk_exe dopus.exe") ;;"ahk_exe explorer.exe" esto se debe cambiar por el sistema de explorador de archivos
	GroupActivate, taranexplorers, r
else
	WinActivate ahk_class dopus.lister ;you have to use WinActivatebottom if you didn't create a window group.

return


AppsKey & F1::
InputBox, siteName, Password Assistant, Escribe el Nombre del sitio,,,,,,, 40,
passwordAssist(siteName)
return



AppsKey & F10::
InputBox, termino, Busqueda de Google, Escribe lo que quieras buscar,,,,,,, 40,
func_myHistory(termino, "search")
Sleep 50
RunWait, https://www.google.com/search?q=%termino%
return

AppsKey & F11::
InputBox, buscarDefinicion, Palabra, Escribe una palabra para buscar su significado,,,,,,, 40, paralelepípedo
func_myHistory(buscarDefinicion, "definition")
Sleep 50
RunWait, https://www.wordreference.com/definicion/%buscarDefinicion%
return

AppsKey & F12::
InputBox, transWord, English Word, Escribe una palabra en inglés para traducirla,,,,,,, 40, Exchange
func_myHistory(transWord, "translate")
Sleep 50
RunWait, https://www.wordreference.com/es/translation.asp?tranword=%transWord%
return



;;;;;;
;;;
;;
AppsKey & Numpad0::
flashOpen("ahk_class dopus.lister", "dopus.exe")
return

AppsKey & Numpad1::
flashOpen("ahk_class OpusApp", "winword.exe")
return

AppsKey & Numpad2::
flashOpen("ahk_class MozillaWindowClass", "firefox.exe")
return


AppsKey & Numpad3::
flashOpen("ahk_exe Notion.exe", "C:\Users\XPC\AppData\Local\Programs\Notion\Notion.exe")
return

;;
;;;;
;;;;;;


AppsKey & Ins::
;este rellena los campos de la boleta de horas conferencia

;miNombre := "Benjamín Álvarez Rodríguez"
;miCorreo := "benjamin.alvarez@ucr.ac.cr"
;miCarnet := "B60401"


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


AppsKey & q::
FormatTime, todaysDate, %A_Now%, yyyyMMdd
send, %todaysDate%
return

AppsKey & w::
FormatTime, todaysDate, %A_Now%, HHmm
send, %todaysDate%
return



AppsKey & f::
FormatTime, todaysDate, %A_Now%, LongDate ;dd 'de' MMMM 'del' yyyy
send, %todaysDate%
return


AppsKey & s::
FormatTime, todaysDate, %A_Now%, ShortDate
send, %todaysDate%
return

AppsKey & c::
FormatTime, todaysDate, %A_Now%, dd 'de' MMMM
send, %todaysDate%
return

AppsKey & h::
FormatTime, todaysDate, %A_Now%, Time
send, %todaysDate%
return

AppsKey & d::
FormatTime, todaysDate, %A_Now%, dd
send, %todaysDate%
return

AppsKey & m::
FormatTime, todaysDate, %A_Now%, MM
send, %todaysDate%
return

AppsKey & a::
FormatTime, todaysDate, %A_Now%, yyyy
send, %todaysDate%
return

AppsKey & t::
FormatTime, todaysDate, %A_Now%, Time
send, %todaysDate%
return

AppsKey & p::
MouseGetPos,x,y
PixelGetColor,rgb,x,y,RGB
StringTrimLeft,rgb,rgb,2
Clipboard=%rgb%
ToolTip, Color %rgb% copiado!
SetTimer, RemoveToolTip, -1500 ;;esto podría tambien ser un sleep y  después volver a poner un tooltip
Return












/* 
 / \-------------, 
 \_,|            | 
    |    ALTGR   | 
    |  ,-----------
    \_/__________/ 
 */
RAlt::
send, {RAlt}
return

#KeyHistory 120
;<^>!a::
RAlt & a::
;MsgBox, % GetKeyName("SC01E")
;MsgBox, %A_PriorKey%
KeyHistory
return




RAlt & ,::
    if GetKeyState("Shift", "P")  
        Send, {ASC 174} ;«
    else  
    send, <
return

RAlt & .::
    if GetKeyState("Shift", "P")  
        Send, {ASC 175} ;»
    else  
    send, >
return









/* 
 / \-------------, 
 \_,|            | 
    |     CTRL   | 
    |  ,-----------
    \_/__________/ 
 */

;Alt Tab Derecho 
Control & XButton2::ShiftAltTab
return
Control & XButton1::AltTab
return


/*
if GetKeyState("Shift", "P") ;esta línea no está sirviendo podría borrarla
RControl & }::ShiftAltTab
return 

RControl & }::AltTab
return
*/



/*if GetKeyState("Shift", "P")  
    ShiftAltTab
    else AltTab
return
*/



/* 
 / \--------------------, 
 \_,|                   | 
    |    Special Keys   | 
    |  ,------------------
    \_/_________________/ 
 */



Browser_Search::
Run, D:\Archivos de Programas\Everything\Everything.exe
Return

Browser_Home::
Winset, Alwaysontop, , A ; Ctrl + Space
return












/* 
██████╗ ██████╗ ███████╗███╗   ███╗██╗███████╗██████╗ ███████╗
██╔══██╗██╔══██╗██╔════╝████╗ ████║██║██╔════╝██╔══██╗██╔════╝
██████╔╝██████╔╝█████╗  ██╔████╔██║██║█████╗  ██████╔╝█████╗  
██╔═══╝ ██╔══██╗██╔══╝  ██║╚██╔╝██║██║██╔══╝  ██╔══██╗██╔══╝  
██║     ██║  ██║███████╗██║ ╚═╝ ██║██║███████╗██║  ██║███████╗
╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
        */                                                       




#IfWinActive ahk_exe Adobe Premiere Pro.exe
;F3 para borrar el clip debajo del playhead
/* F3::
Send, d
Send, +{Delete}
return
 */
 
;Borrar clip solo
;XButton1::
^Mbutton::
send, ^{F1}
sleep, 50
send, ^{F3}
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

;In and Out for Work Area
<^>!i::
send,^+!9 ;asignar ctrl alt shift 9 en premiere
return


<^>!o::
send,^+!0 ;asignar ctrl alt shift 0 en premiere
return

;move playhead at cursor CTRL ALT SHIFT Right Click in Premiere
+RButton::
Click Middle
send,^+!|
return


;una función
 reproducirTimeline(mitecla)
{
    Click Middle ;pone focus en el timeline sobre el que esté el mouse
    send,^+!|
    sleep 50
    send %mitecla%
    return
}   

XButton1::
reproducirTimeline("l")
return

XButton2::
reproducirTimeline("j")
return


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

Sendinput, k
Sleep 10
Sendinput, k

MouseGetPos, xposP, yposP
sendinput, {MButton}
sleep 5
Send, ^F6
Sendinput, +f

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



/* 
███████╗██╗  ██╗██████╗ ██╗      ██████╗ ██████╗ ███████╗██████╗ 
██╔════╝╚██╗██╔╝██╔══██╗██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗
█████╗   ╚███╔╝ ██████╔╝██║     ██║   ██║██████╔╝█████╗  ██████╔╝
██╔══╝   ██╔██╗ ██╔═══╝ ██║     ██║   ██║██╔══██╗██╔══╝  ██╔══██╗
███████╗██╔╝ ██╗██║     ███████╗╚██████╔╝██║  ██║███████╗██║  ██║
╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
     */                                                             


#IfWinActive ahk_exe ahk_exe Explorer.EXE

/*
MButton::
send, {RButton}
sleep, 10
send, e
return
*/






/* MsgBox, 3,, Select YES to open the latest %filetype% at Fpath:`n`n%Fpath%
IfMsgBox, Yes
	{
	Run %Fpath%
	}
} 
*/





