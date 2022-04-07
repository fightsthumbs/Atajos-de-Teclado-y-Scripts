#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir D:\AHK_Support_Files\ ;%A_ScriptDir%  ; Ensures a consistent starting directory.



;;variables
SEARCH_URL := {g: "https://www.google.com/search?q=", e: "https://www.ecosia.org/search?q=", d:"https://duckduckgo.com/?q=", br: "https://search.brave.com/search?q=", q: "https://www.qwant.com/?q=", w: "", m: "https://www.mojeek.com/search?q=", sp:"https://www.startpage.com/do/search?q="}
TRANSLATE_URL := {wr: "https://www.wordreference.com/es/translation.asp?tranword=", sd:"https://www.spanishdict.com/translate/"}
DEFINITION_URL := {rae: "https://dle.rae.es/", wr: "https://www.wordreference.com/definicion/"}
BROWSERS_EXE := {firefox: "firefox.exe", brave: "brave.exe", opera: "opera.exe", edge: "msedge", chrome: "chrome.exe"}
BROWSERS_CLASS := {firefox: "ahk_class MozillaWindowClass", brave: "ahk_exe brave.exe", opera: "ahk_exe opera.exe", edge: "ahk_exe msedge.exe", chrome: "ahk_exe chrome.exe"}



;;Crea un archivo ini que el script utilizara como fuente de ciertas configuraciones. si el archivo ya existe se saltará este paso
if FileExist("AHK_settings.ini")
{ 
} else {
    iniFile := FileOpen("AHK_settings.ini", "w")
    iniFileContent := "[FILEPATHS]`r`nfirstPath=`r`nsecondPath=`r`nthirdPath=`r`nfourthPath=`r`nfifthPath=`r`nsixthPath=`r`nsevenPath=`r`neightPath=`r`nninthPath=C:\`r`ntenthPath=D:\`r`neleventhPath=E:\`r`ntwelfthPath=`r`n[TRANSPARENT]`r`ntransValue=200`r`n[SEARCH_ENGINES]`r`nsearchWith=g|br"

  ; When writing a file this way, use `r`n rather than `n to start a new line.
iniFile.Write(iniFileContent)
iniFile.Close()
}


;; Crea un archivo ini con configuraciones para premiere; sobre todo relativas a los presets
if FileExist("AHK_PR_Presets.ini")
{ 
} else {
    iniFilePR := FileOpen("AHK_PR_Presets.ini", "w")
    iniFilePRContent := "[PRESETS]`r`nfirstPreset=`r`n"


  ; When writing a file this way, use `r`n rather than `n to start a new line.
iniFilePR.Write(iniFilePRContent)
iniFilePR.Close()
}



;crear un csv en el que se almacenarán las busquedas y se crearán los encabezados en el timestamp, el tipo de búsqueda y el término buscado
if FileExist("AHK_history.csv")
{ 

} else {
    csvFile := FileOpen("AHK_history.csv", "w")
    csvFileContent := "datetime;tag;term;`r`n"

  ; When writing a file this way, use `r`n rather than `n to start a new line.
csvFile.Write(csvFileContent)
csvFile.Close()
}

if FileExist("AHK_PR_Presets.ini")
{ 
} else {
    iniFilePR := FileOpen("AHK_PR_Presets.ini", "w")
    iniFilePRContent := "[PRESETS]`r`nfirstPreset=`r`n"


  ; When writing a file this way, use `r`n rather than `n to start a new line.
iniFilePR.Write(iniFilePRContent)
iniFilePR.Close()
}





;;;;;;Include Section
#Include, %A_LineFile%\..\Esperanto v2.ahk
#Include, %A_LineFile%\..\PasswordAssistant.ahk
#Include, %A_LineFile%\..\CCKAMPUS.ahk
#Include, %A_LineFile%\..\Premiere Presets.ahk
#Include, %A_LineFile%\..\HotStrings.ahk
#Include, %A_LineFile%\..\Create Folder Structure for Projects.ahk
#Include, %A_LineFile%\..\ShutdownTimer.ahk
; #Include, D:\Documentos\AutoHotKey Scripts\Alt_menu_acceleration_DISABLER.ahk
return




/* 
 ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗     
██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██║     
██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██║     
██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██║     
╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║███████╗
 ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
     */  


SetWorkingDir D:\AHK_Support_Files\




;;subrutina para remover los tooltips
RemoveToolTip:
ToolTip
return

;;funcion que permite mostrar 
;;cual es la tecla que se está presionando mediante un tooltip
showTooltip(x) { 
    ToolTip You pressed %x%. 
    SetTimer, RemoveToolTip, -1500
    return 
}

;;funcion historial de búsqueda.
func_myHistory(termino, etiqueta) {
    ;SetWorkingDir, D:\
    ;;Append: Creates a new file if the file didn't exist, 
    historyFile := FileOpen("AHK_history.csv", "a") 
    ;;InputBox, var_mensaje, Title, Prompt
                                    
    FormatTime, var_fechayhora,, yyyyMMdd-HH:mm:ss ;;ISO 8601
    historyFile.Write("`r`n" var_fechayhora ";" etiqueta ";" termino)
    historyFile.Close()
    ;SetWorkingDir %A_ScriptDir%
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

flashOpen2(nombre, exe, tag) {
sleep 11 ;this is to avoid the stuck modifiers bug
IfWinNotExist, %nombre% ;;ahk_class CabinetWClass
    Run, %exe% ;;explorer.exe
    GroupAdd, %tag%, %nombre%
if WinActive("ahk_exe "exe) ;;"ahk_exe explorer.exe" esto se debe cambiar por el sistema de explorador de archivos
	GroupActivate, %tag%, r
else
	WinActivate %nombre% ;you have to use WinActivatebottom if you didn't create a window group.

return
}


;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


favouritePaths(x) {

    if GetKeyState("LAlt", "P")
        changeFavouritePaths(x)
    else  
        gotofavouritePaths(x) 
    return
}

;;ir al la ruta favorita designada de previo
gotofavouritePaths(x) {
    IniRead,FilePath, AHK_settings.ini, FILEPATHS, %x%Path
    Run % FilePath
    return
}


;cambiar la ruta designada
changeFavouritePaths(x) {
    FileSelectFolder, newFilePath, , 3
    if newFilePath =
    MsgBox, You didn't select a folder. The path will stay the same.
    else
     IniWrite, %newFilePath%, AHK_settings.ini, FILEPATHS, %x%Path
    return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;favouritePaths END;;;;;;;;





;  ()()                         ____ 
;  (..)                        /|o  |
;  /\/\  GUI SET TRANSPARENCY /o|  o|
; c\db/o...................../o_|_o_|
                     

transSlider:
Gui, Destroy
Gui Color, A30A0A
Gui, Add, GroupBox, x22 y19 w170 h340 , Set transparency
Gui, Add, Slider, x42 y49 w50 h290 vtransValue +Vertical +Thick30 +Range0-255 +Invert TickInterval15 +Center +ToolTipTop, 130 
Gui, Add, Button, x102 y49 w90 h30 gSetTrans, SET
Gui, Add, Button, x102 y89 w90 h30 gcurrentTransValue, Current Value
Gui, Add, Button, x112 y189 w50 h40 gpresetTransValue1, 200
Gui, Add, Button, x112 y239 w50 h40 gpresetTransValue2, 100
Gui, Add, Button, x112 y289 w50 h40 gpresetTransValue3, 50
; Generated using SmartGUI Creator 4.0
Gui, Show, x210 y264 h378 w217, Set Transparency
return


SetTrans:
    Gui Submit, NoHide
    IniWrite, %transValue%, AHK_settings.ini, TRANSPARENT, transValue
    Gui, Destroy
return

currentTransValue:
    IniRead, currentTransValue, AHK_settings.ini, TRANSPARENT, transValue
MsgBox, %currentTransValue%
return

presetTransValue1:

    IniWrite, 200, AHK_settings.ini, TRANSPARENT, transValue
    Gui, Destroy
return

presetTransValue2:

    IniWrite, 100, AHK_settings.ini, TRANSPARENT, transValue
    Gui, Destroy
return

presetTransValue3:

    IniWrite, 50, AHK_settings.ini, TRANSPARENT, transValue
    Gui, Destroy
return



/* 
GuiClose:
GuiEscape:
    ExitApp
return

 */



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


;LWin & F7::
;showTooltip(A_ThisHotkey)
;return

; LWin & F6::
; FileSelectFolder, OutputVar, , 3
; if OutputVar =
;     MsgBox, You didn't select a folder.
; else
;     MsgBox, You selected folder "%OutputVar%".
; return



$LWin::Send, {LWin}
return


;;;;;;Favourite Paths;;;;;;;

LWin & F1::
favouritePaths("first")
return

LWin & F2::
favouritePaths("second")
return

LWin & F3::
favouritePaths("third")
return

LWin & F4::
favouritePaths("fourth")
return

LWin & F5::
favouritePaths("fifth")
return

LWin & F6::
favouritePaths("sixth")
return

LWin & F7::
favouritePaths("seventh")
return

LWin & F8::
favouritePaths("eighth")
return

LWin & F9::
favouritePaths("ninth")
return

LWin & F10::
favouritePaths("tenth")
return

LWin & F11::
favouritePaths("eleventh")
return

LWin & F12::
favouritePaths("twelfth")
return

;;;;;;Favourite Paths END;;;;;;;







/* 
MyValue := 120

F1::
Gui Color, 303030
Gui, Add, Text, , Text
Gui, Add, Slider, vMyValue Range1-255 Thick30 TickInterval15 ToolTipRight Buddy1MyTopText, 190, 
Gui Add, Button, ym x150 y30 w100 h40 gSetTrans, OK
Gui Show, w300 h100, Test

return

SetTrans:
    Gui Submit, NoHide
    ;WinSet, Transparent, %MyValue%, A

    ;MsgBox 0x40, Transparencia, % MyValue
return

GuiClose:
GuiEscape:
    ExitApp
return
 */

transToggle	:= 0
return



LWin & Browser_Home::
LWin & MButton::
if GetKeyState("LAlt", "P") {

 /*    InputBox, newValue
    if newValue =
    MsgBox, You didn't select a folder.
    else
    IniWrite, %newValue%, AHK_settings.ini, TRANSPARENT, transValue
    return 
    */
    Gosub, transSlider
    ;transSetValue()
} 
else  {
    IniRead, MyValue, AHK_settings.ini, TRANSPARENT, transValue
    ;MyValue := 160
	; This is where the toggling occurs. You're setting the toggle to the opposite of itself.
	; 1 becomes 0. True becomes False. You can use either.
    transToggle	:= !transToggle

	if (transToggle = 0){
        
		; If the toggle is off (0 or false), do the stuff in here
		WinSet, Transparent, %MyValue%, A
	}
	else {
		; If the toggle is on (1 or true), do the stuff in here
		WinSet, Transparent, Off, A
	}
}   
return





;;Open Setttings file
#!NumpadDot::
Gui, Destroy
Gui, Add, Edit, x62 y29 w340 h240 vMyEdit
Gui, Add, Button, x62 y279 w170 h30 gSaveSettings, Save
Gui, Add, Button, x242 y279 w160 h30 gCancel, Cancel
Gui, Add, Button, x410 y29 w80 h100 gOpenHistory, Open History
FileRead, FileContents, AHK_settings.ini
GuiControl,, MyEdit, %FileContents%

Gui, Show, x403 y290 h380 w500, Edit Settings File
Return

SaveSettings:
    Gui Submit, NoHide
    FileDelete, AHK_settings.ini 
    FileAppend, %MyEdit%, AHK_settings.ini 
    Gui, Destroy
return


OpenHistory:
    Gui Submit, NoHide
    RunWait, AHK_history.csv
    Gui, Destroy
return    




; GuiClose:
; ExitApp




/* 
 / \------------------, 
 \_,|                 | 
    |    CTRL SHIFT   | 
    |  ,----------------
    \_/_______________/ 
*/                   
                                                                      

;subrutina Everyting
run_everything:
Run everything
Exit


; Buscar texto seleccionado en google
^+F3::
Gosub, run_everything
; return

^+F4::
;Run, "D:\Archivos de Programas\BRU_NoInstall\64-bit\Bulk Rename Utility.exe"
Run, "C:\Program Files\Bulk Rename Utility\Bulk Rename Utility.exe"
return

;Buscar en Ecosia el texto seleccionado
^+F5::
{

 Send, ^c
 Sleep 50
 func_myHistory(clipboard, "searchFromClipboard")
 IniRead, searchEnginesArray, AHK_settings.ini, SEARCH_ENGINES, searchWith
 Loop, parse, searchEnginesArray, |
	{
		;;msgbox, %A_LoopField%
        defaultBrowser := BROWSERS_EXE[defaultBrowser_whatis()]
		searchWith := SEARCH_URL[A_LoopField]
		RunWait, %defaultBrowser% " " `"%searchWith% %clipboard%`"
        sleep 15
	}
}
Return

; ^+F6::
; Run, "C:\Program Files (x86)\Internet Download Manager\IDMan.exe"
; return

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
return
 */

^+F10::
Return

^+F11::
Return


RButton & Mbutton::
break::
Send {Volume_Mute} ; Br*eak key mutes
; send, {Esc}
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
; AppsKey & {::
; Return



;;;;SHUTDOWN;;;;
AppsKey & Del::
Gosub, shutdownTimer 
return
;;;;SHUTDOWN;;;;



~RButton & WheelUp::
AppsKey & WheelUp::
;msgbox,,,you pressed F9,0.6
;While GetKeyState("AppsKey", "p")
;{
    Send, {Volume_Up 3}
    Sleep, 10 ; Add a delay if you want to increase the interval between keystokes.
;}
return

~RButton & WheelDown::
AppsKey & WheelDown::
;msgbox,,,you pressed F9,0.6
;While GetKeyState("AppsKey", "p")
;{
    Send, {Volume_Down 3}
    Sleep, 10 ; Add a delay if you want to increase the interval between keystokes.
;}
return


;; función que retorna una variable que contiene el ejecutable del buscador por defecto
defaultBrowser_whatis() {
    IniRead, defaultBrowser_Key, AHK_settings.ini, SEARCH_ENGINES, searchBrowser
    Return defaultBrowser_Key
}

AppsKey & F1::
InputBox, siteName, Password Assistant, Escribe el Nombre del sitio,,,,,,, 40,
passwordAssist(siteName)
return



AppsKey & F10::
InputBox, termino, Busqueda de Google, Escribe lo que quieras buscar,,,,,,, 40,
    if ErrorLevel 
        return
    else
        func_myHistory(termino, "search")
        IniRead, searchEnginesArray, AHK_settings.ini, SEARCH_ENGINES, searchWith
        Sleep 50
        Loop, parse, searchEnginesArray, |
        {
            ;;msgbox, %A_LoopField%
            searchWith := SEARCH_URL[A_LoopField]
            defaultBrowser := BROWSERS_EXE[defaultBrowser_whatis()]
            searchTerm := searchWith termino
            RunWait, %defaultBrowser% `"%searchTerm%`"
        }
        ;;RunWait % SearchTool.br termino
            ;;RunWait % SearchTool.e termino
return

AppsKey & F11::
InputBox, buscarDefinicion, Palabra, Escribe una palabra para buscar su significado,,,,,,, 40, paralelepípedo
    if ErrorLevel 
        return
    else
        func_myHistory(buscarDefinicion, "definition")
        Sleep 50
        defaultBrowser := BROWSERS_EXE[defaultBrowser_whatis()]
        RunWait, %defaultBrowser% `"https://www.wordreference.com/definicion/%buscarDefinicion%`"
        RunWait, %defaultBrowser% `"https://dle.rae.es/%buscarDefinicion%`"
return

AppsKey & F12::
InputBox, transWord, English Word, Escribe una palabra en inglés para traducirla,,,,,,, 40, Exchange
    if ErrorLevel 
        return
    else
        func_myHistory(transWord, "translate")
        Sleep 50
        defaultBrowser := BROWSERS_EXE[defaultBrowser_whatis()]
        RunWait, %defaultBrowser% `"https://www.wordreference.com/es/translation.asp?tranword=%transWord%`"
        RunWait, %defaultBrowser% `"https://www.spanishdict.com/translate/%transWord%`"
return



;;;;;;
;;;
;;


; ´+lñ{},.-

AppsKey & 0::
run "D:\WindowsApps\TogglO.TogglDesktop_7.5.445.0_x64__txsjqv20xc8gw\TogglDesktop\TogglDesktop.exe"

Return

AppsKey & '::
run code
Return

AppsKey & NumpadAdd::
AppsKey & ¿::
Run, "D:\Documentos\AutoHotKey Scripts\Magnifiyer.ahk"
Return


AppsKey & l::
return

AppsKey & Tab::
AppsKey & Home::
; AppsKey & ñ::
createFolderStructure()
return

AppsKey & ñ::
return

AppsKey & ´::
return

AppsKey & +::
return



AppsKey & NumpadMult::
RunWait, powershell saps wt.exe -verb runas
return


AppsKey & {::
flashOpen2("Notas rápidas", "shell:AppsFolder\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe!App", "quickNotes") ;stickynotes.lnk  ;C:\Windows\explorer.exe
return

AppsKey & }::
return

AppsKey & ,::
RunWait, wt.exe
return

AppsKey & .::
return

AppsKey & -::
flashOpen2("ahk_class dopus.lister", "dopus.exe", "explorers")
return

AppsKey & Numpad0::
; flashOpen("ahk_class dopus.lister", "dopus.exe")
flashOpen2("ahk_class dopus.lister", "dopus.exe", "explorers")
return

AppsKey & Numpad1::
; flashOpen("ahk_class OpusApp", "winword.exe")
flashOpen2("ahk_class SALFRAME", "swriter.exe", "texteditor")
return

AppsKey & Numpad2::
    IniRead, defaultBrowser, AHK_settings.ini, SEARCH_ENGINES, defaultBrowser
    browserClass := BROWSERS_CLASS[defaultBrowser]
    browserExe := BROWSERS_EXE[defaultBrowser]
    flashOpen2(ByRef browserClass, ByRef browserExe, "browser")
return

AppsKey & n::
AppsKey & Numpad3::
; flashOpen("ahk_exe Notion.exe", "C:\Users\XPC\AppData\Local\Programs\Notion\Notion.exe")
flashOpen2("ahk_exe Notion.exe", "C:\Users\XPC\AppData\Local\Programs\Notion\Notion.exe", "notion")
return


AppsKey & Numpad4::
flashOpen("ahk_exe IDMan.exe", "C:\Program Files (x86)\Internet Download Manager\IDMan.exe")
return

AppsKey & Numpad7::
flashOpen("ahk_class Notepad", "notepad.exe")
return



;;
;;;;
;;;;;;





AppsKey & q::
FormatTime, todaysDate, %A_Now%, yyyyMMdd ;;ISO 8601
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

AppsKey & o::
CoordMode, Mouse, Screen
MouseGetPos,xPos,yPos
Clipboard= %xPos%, %yPos%
ToolTip, valor %xPos%x%yPos% copiado!
SetTimer, RemoveToolTip, -1500 ;;esto podría tambien ser un sleep y  después volver a poner un tooltip
Return







AppsKey & Up::
send, ↑
return

AppsKey & Down::
send, ↓
return

AppsKey & Right::
send, →
return

AppsKey & Left::
send, ←
return




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


RAlt & -::
    if GetKeyState("Shift", "P")  
        Send, {ASC 175} ;»
    else  
    send, —
return

RAlt & ´::
    if GetKeyState("Shift", "P")  
        Send, {ASC 175} ;»
    else  
    send, {ASC 96} ;backtick
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
Gosub, run_everything
; return
;

Browser_Home::
Winset, Alwaysontop, , A ; Ctrl + Space
return

^Launch_App1::
<^>!F12::
gotofavouritePaths("first")
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
; send, ^{F1}
; sleep, 50
; send, ^{F3}
MouseClick, Middle
MouseClick, Middle
sleep, 50
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

/* 
;In and Out for Work Area
<^>!i::
send,^+!9 ;asignar ctrl alt shift 9 en premiere
return


<^>!o::
send,^+!0 ;asignar ctrl alt shift 0 en premiere
return
 */


;move playhead at cursor CTRL ALT SHIFT Right Click in Premiere
+RButton::
Click Middle
send,^+!|
return


;una función
 reproducirTimeline(mitecla,veces:=1)
{
    Click Middle ;pone focus en el timeline sobre el que esté el mouse
    send,^+!|
    sleep 15
    Loop %veces%
{
    send {%mitecla%}  ; Auto-repeat consists of consecutive down-events (with no up-events).
    Sleep 30  ; The number of milliseconds between keystrokes (or use SetKeyDelay).
}
    
    return
}   




XButton1::
; if GetKeyState("Shift", "P")
;         reproducirTimeline("l", "2")
;     else  
    reproducirTimeline("l")  

return

+XButton1::

    reproducirTimeline("l","2")  

return

XButton2::
reproducirTimeline("j")
return

+XButton2::

    reproducirTimeline("j","2")  

return

!RButton::
MouseClick, Middle
if GetKeyState("LAlt", "P") = 1
		{
		loop
	{
			Send ^+!| ;in premiere, this must be set to "move playhead to cursor."
			;Tooltip, button 5 playhead mod!
			sleep 16 ;this loop will repeat every 16 milliseconds.
			if GetKeyState("RButton", "P") = 0
				{
				;msgbox,,,time to break,1
				;tooltip,   
                MouseClick, Right
                send, {Esc} 
                send, ^+a
                return
				; goto theEnd2
				; break
				}
			}
}
theEnd2:
MouseClick, middle
Return





^|::
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
    BlockInput, On
 sleep 25
;    /*  MouseMove, %startxpos%, %startypos%
;     sleep 20
;     sendInput ^+!|
;     sleep 20
;     sendInput dc
;     ; sendInput c
;     sleep 20
;     MouseMove, %endxpos%, %endypos%
;     sleep 50
;     sendInput ^+!|
;     sleep 20
;     sendInput dq
;     ; sendInput q
;     send {F3} 

    
    ; MouseMove, %startxpos%, %startypos%
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
    sendInput {F3}
    sleep 10
    sendInput ^+x
     sleep 10
   

    BlockInput, Off
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


^!+F1::
send,^!{F6}
send, ^k
send,^!{F6 3} 
send, q
return

;#Include, D:\Documentos\AutoHotKey Scripts\Premiere Presets.ahk



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

sendInput, k
Sleep 10
sendInput, k

MouseGetPos, xposP, yposP
sendInput, {MButton}
sleep 5
Send, ^F6
sendInput, +f

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





