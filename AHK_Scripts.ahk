﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir G:\AHK_Support_Files\ ;%A_ScriptDir%  ; Ensures a consistent starting directory.



;;variables
#Include, %A_LineFile%\..\variables.ahk


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

#Include, %A_LineFile%\..\esperanto_keys.ahk
#Include, %A_LineFile%\..\PasswordAssistant.ahk
#Include, %A_LineFile%\..\misc_hotstrings.ahk
#Include, %A_LineFile%\..\premiere_presets.ahk
#Include, %A_LineFile%\..\hotStrings.ahk
#Include, %A_LineFile%\..\hotStrings_priv.ahk
#Include, %A_LineFile%\..\mk_project_folder_structure.ahk
#Include, %A_LineFile%\..\ShutdownTimer.ahk
#Include, %A_LineFile%\..\pdf_paste_fix.ahk
#Include, %A_LineFile%\..\SpotifyGlobalKeys.ahk
;

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


;SetWorkingDir G:\AHK_Support_Files\



tooltipAtMouse(message, time:=-3000)
 {
    CoordMode, ToolTip, Screen
    MouseGetPos, xTTMouse, yTTMouse
    ToolTip, %message%, %xTTMouse%, %yTTMouse%
    SetTimer, RemoveToolTip, %time%
 }

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
Gui, Add, Button, x410 y30 w80 h49 gOpenHistory, Open History
Gui, Add, Button, x410 y80 w80 h49 gOpenSettings, Open Settings
Gui, Add, Button, x410 y130 w80 h49 gOpenVariables, Open Variables
Gui, Add, Button, x410 y180 w80 h49 gOpenPremierePresets, PR Presets
Gui, Add, Button, x410 y230 w80 h49 gOpenNotes, Book Notes
Gui, Add, Button, x410 y280 w80 h49 gOpenSettings, Free Button
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

OpenSettings:
    Gui Submit, NoHide
    RunWait, AHK_settings.ini
    Gui, Destroy
return

OpenVariables:
    Gui Submit, NoHide
    Run "notepad" "%A_LineFile%\..\variables.ahk"
    Gui, Destroy
return

OpenPremierePresets:
    Gui Submit, NoHide
    Run "notepad" AHK_PR_Presets.ini
    Gui, Destroy
return

OpenNotes:
Gui, Destroy
    Gui, Add, ListView, r20 w700 gMyListView, Name|Size (KB)
    Loop, %A_WorkingDir%\*.txt*
        LV_Add("", A_LoopFileName, A_LoopFileSizeKB)
    ; Gui, Destroy

    LV_ModifyCol()  ; Auto-size each column to fit its contents.
    LV_ModifyCol(2, "Integer")  ; For sorting purposes, indicate that column 2 is an integer.

; Display the window and return. The script will be notified whenever the user double clicks a row.
Gui, Show
return

MyListView:
if (A_GuiEvent = "DoubleClick")
{
    LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
    RunWait, %RowText%
    ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%"
    SetTimer, RemoveToolTip, -1500
}
return


Return

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
 IniRead, optionsArray, AHK_settings.ini, SEARCH_ENGINES, searchWith
 Loop, parse, optionsArray, |
	{
		
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


~RButton & Mbutton::
break::
Send {Volume_Mute} ; Br*eak key mutes
; send, {Esc}
return

~RButton & XButton1::
Send {Media_Play_Pause} ; Br*eak key mutes
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
        IniRead, optionsArray, AHK_settings.ini, SEARCH_ENGINES, searchWith
        Sleep 50
        Loop, parse, optionsArray, |
        {
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
        IniRead, optionsArray, AHK_settings.ini, SEARCH_ENGINES, definitionWith
        Sleep 50
        Loop, parse, optionsArray, |
        {
            searchWith := DEFINITION_URL[A_LoopField]
            defaultBrowser := BROWSERS_EXE[defaultBrowser_whatis()]
            searchTerm := searchWith buscarDefinicion
            RunWait, %defaultBrowser% `"%searchTerm%`"
        }
return

AppsKey & F12::
InputBox, transWord, English Word, Escribe una palabra en inglés para traducirla,,,,,,, 40, Exchange
    if ErrorLevel 
        return
    else
        func_myHistory(transWord, "translate")
        IniRead, optionsArray, AHK_settings.ini, SEARCH_ENGINES, translateWith
        Sleep 50
        Loop, parse, optionsArray, |
        {
            searchWith := TRANSLATE_URL[A_LoopField]
            defaultBrowser := BROWSERS_EXE[defaultBrowser_whatis()]
            searchTerm := searchWith transWord
            RunWait, %defaultBrowser% `"%searchTerm%`"
        }
return


AppsKey & PrintScreen::
if GetKeyState("Control", "P") {
    sleep, 50
    send, ^c
    sleep, 50
    esperantoVorto = %Clipboard%
}
else {
    InputBox, esperantoVorto, Esperanto Vortaro, Entajpu vorton en Esperanto por serĉi la difinon,,,,,,, 40, Saluton
}
    if ErrorLevel 
        return
    else
        func_myHistory(esperantoVorto, "esperanto")
        IniRead, optionsArray, AHK_settings.ini, SEARCH_ENGINES, espoWith
        Sleep 50
        Loop, parse, optionsArray, |
        {
            searchWith := ESPO_URL[A_LoopField]
            defaultBrowser := BROWSERS_EXE[defaultBrowser_whatis()]
            searchTerm := searchWith esperantoVorto
            RunWait, %defaultBrowser% `"%searchTerm%`"
        }
return

AppsKey & i::
if GetKeyState("Control", "P") {
    sleep, 15
    send, ^c
    sleep, 50
    parolaItaliana = %Clipboard%
    ; MsgBox, %parolaItaliana%
} ; indica que alguna de las dos condiciones debe ser verdadera, pero solo una.
else {
    InputBox, parolaItaliana, Dizionario Italiano, Scrivi una parola in italiano,,,,,,, 40, ;dosso
}  
if ErrorLevel 
    return
else
    func_myHistory(parolaItaliana, "italiano")
    IniRead, optionsArray, AHK_settings.ini, SEARCH_ENGINES, itaWith
    Sleep 50
    Loop, parse, optionsArray, |
    {
        searchWith := ITA_URL[A_LoopField]
        defaultBrowser := BROWSERS_EXE[defaultBrowser_whatis()]
        searchTerm := searchWith parolaItaliana
        RunWait, %defaultBrowser% `"%searchTerm%`"
    }
return


;;;;;;
;;;
;;


; ´+lñ{},.-
#KeyHistory 120
AppsKey & ScrollLock::
KeyHistory
return

AppsKey & Pause::
MsgBox, Lets go to slepp
Sleep, 20
DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
return

AppsKey & 0::
;run 

Return

AppsKey & '::
run code
Return

AppsKey & NumpadAdd::
AppsKey & ¿::
Run, "%A_LineFile%\..\Magnifiyer.ahk"
Return


AppsKey & l::
return

AppsKey & Home::
flashOpen2("ahk_exe Obsidian.exe", "C:\Users\fight\AppData\Local\Programs\Obsidian\Obsidian.exe", "obsidian")
Return


AppsKey & Tab::

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
flashOpen2("ahk_exe Notion.exe", "C:\Users\fight\AppData\Local\Programs\Notion\Notion.exe", "notion")
return


AppsKey & Numpad4::
flashOpen("ahk_exe IDMan.exe", "C:\Program Files (x86)\Internet Download Manager\IDMan.exe")
return

#|::
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
███████╗██╗  ██╗██████╗ ██╗      ██████╗ ██████╗ ███████╗██████╗ 
██╔════╝╚██╗██╔╝██╔══██╗██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗
█████╗   ╚███╔╝ ██████╔╝██║     ██║   ██║██████╔╝█████╗  ██████╔╝
██╔══╝   ██╔██╗ ██╔═══╝ ██║     ██║   ██║██╔══██╗██╔══╝  ██╔══██╗
███████╗██╔╝ ██╗██║     ███████╗╚██████╔╝██║  ██║███████╗██║  ██║
╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
     */                                                             


#IfWinActive ahk_exe ahk_exe Explorer.EXE
Return

#Include, %A_LineFile%\..\bookmarksNotes.ahk
Return

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





