#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir D:\AHK_Support_Files\  ; Ensures a consistent starting directory.

/*
;;;;;;;;TAGS;;;;;;;
T : Transition
S : Scale
P : Position
R  : Rotation
OP : Opacity
LMTR : Lumetri
WS : Warp Stabilizer
CROP : 
TXT : 
ZOOM : 
FILTER : 
GB : Gaussian Blur




*/




presetSelector:
    IniRead,presets, AHK_PR_Presets.ini, PRESET_LIST, list
    ; presets := "180 hue |AU PITCH SHIFTER |AU Vocal Enhacer |Crop 50 LEFT |Crop 50 RIGHT |CROP B50 |CROP T50 |FADE IN 4f |FLIP H |INVERT preset |LUMA KEY preset |M 100 to 120 zoom |M 50 scale |o multiply |O normal |Pitch Shifter A OPENED |Pitch Shifter DOWN |Pitch Shifter UP |Pitch Shifter UP FULL |RESET ALL |TXT Animation text |CCKampus_ZOOM 10pc |CCKampus_ZOOM15pc |CCKampus_ZoomIN&OUT 15 |CCKampus_ZoomIN15pc |GB 50 |T RedSlide LefttoRight | |S 65 |T Redslide CentertoSide |S 4k Material |WARP PRESET 2 |ZOOM 15 POSxRight |ZOOM IN 115 |ZOOM In_15"


Gui, Destroy
Gui, Color, 9999FF
Gui, Font, s8, Verdana
Gui, Add, GroupBox, x12 y29 w390 h120 , GroupBox
Gui, Add, Button, x32 y49 w50 h40 gPreset1, Preset 01
Gui, Add, Button, x92 y49 w50 h40 gPreset2, Preset 02
Gui, Add, Button, x152 y49 w50 h40 gPreset3, Preset 03
Gui, Add, Button, x212 y49 w50 h40 gPreset4, Preset 04
Gui, Add, Button, x272 y49 w50 h40 gPreset5, Preset 05
Gui, Add, Button, x332 y49 w50 h40 gPreset6, Preset 06
Gui, Add, Button, x32 y99 w50 h40 gPreset7, Preset 07
Gui, Add, Button, x92 y99 w50 h40 gPreset8, Preset 08
Gui, Add, Button, x152 y99 w50 h40 gPreset9, Preset 09
Gui, Add, Button, x212 y99 w50 h40 gPreset10, Preset 10
Gui, Add, Button, x272 y99 w50 h40 gPreset1, Preset 11
Gui, Add, Button, x332 y99 w50 h40 gPreset1, Preset 12
Gui, Add, ListBox, x32 y162 w349 h121 vSelectedPreset, %presets%
; Generated using SmartGUI Creator 4.0
Gui, Show, x294 y267 h304 w428, New GUI Window
Return

submitPreset:
Gui, Submit, NoHide
return

GuiEscape:
GuiClose:
Gui, Destroy
return



#IfWinActive ahk_exe Adobe Premiere Pro.exe

preset(x) {

    if GetKeyState("LAlt", "P")
        changePresetName(x)
    else  
        addPreset(x)
    return
}

sendPresetName(x) {
    IniRead,presetName, AHK_PR_Presets.ini, PRESETS, %x%Preset
    sendInput % presetName
    return
}

changePresetName(x) {
    InputBox, presetName
    if presetName =
    MsgBox, No preset Selected.
    else
     IniWrite, %presetName%, AHK_PR_Presets.ini, PRESETS, %x%Preset
    return
}




$|::send, {|}
return

$'::send, {'}
return



' & 1::
| & 1::
preset("first")
return

' & 2::
| & 2::
preset("second")
return

' & 3::
| & 3::
preset("third")
return

' & 4::
| & 4::
preset("fourth")
return

' & 5::
| & 5::
preset("fifth")
return

' & 6::
| & 6::
preset("sixth")
return

' & 7::
| & 7::
preset("seventh")
return

' & 8::
| & 8::
preset("eighth")
return


' & 9::
| & 9::
preset("ninth")
return


| & 0::
' & 0::
preset("tenth")
return

| & q::
Gosub presetSelector
return




Preset1:
Gui, Submit, NoHide
if (SelectedPreset = "")
{
msgbox, no se seleccionó ningun elemento
    return
} else {
IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, firstPreset
}
;msgbox, se ha seleccionado el preset numero 1
return

Preset2:
Gui, Submit, NoHide
if (SelectedPreset = "")
{
msgbox, no se seleccionó ningun elemento
    return
} else {
IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, secondPreset
}
; msgbox, se ha seleccionado el preset numero 2
return

Preset3:
Gui, Submit, NoHide
if (SelectedPreset = "")
{
msgbox, no se seleccionó ningun elemento
    return
} else {
IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, thirdPreset
}
; msgbox, se ha seleccionado el preset numero 3
return

Preset4:
Gui, Submit, NoHide
if (SelectedPreset = "")
{
msgbox, no se seleccionó ningun elemento
    return
} else {
IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, fourthPreset
}
; msgbox, se ha seleccionado el preset numero 4
return

Preset5:
; msgbox, se ha seleccionado el preset numero 5
Gui, Submit, NoHide
if (SelectedPreset = "")
{
msgbox, no se seleccionó ningun elemento
    return
} else {
IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, fifthPreset
}
return

Preset6:
;msgbox, se ha seleccionado el preset numero 6
Gui, Submit, NoHide
if (SelectedPreset = "")
{
msgbox, no se seleccionó ningun elemento
    return
} else {
IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, sixthPreset
}
return


Preset7:
;msgbox, se ha seleccionado el preset numero 7
Gui, Submit, NoHide
if (SelectedPreset = "")
{
msgbox, no se seleccionó ningun elemento
    return
} else {
IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, seventhPreset
}
return

Preset8:
Gui, Submit, NoHide
if (SelectedPreset = "")
{
msgbox, no se seleccionó ningun elemento
    return
} else {
IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, eighthPreset
}
;msgbox, se ha seleccionado el preset numero 8
return

Preset9:
Gui, Submit, NoHide
if (SelectedPreset = "")
{
msgbox, no se seleccionó ningun elemento
    return
} else {
IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, ninthPreset
}
;msgbox, se ha seleccionado el preset numero 9
return

Preset10:
Gui, Submit, NoHide
if (SelectedPreset = "")
{
msgbox, no se seleccionó ningun elemento
    return
} else {
IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, tenthPreset
}
;msgbox, se ha seleccionado el preset numero 10
return

Preset11:
msgbox, se ha seleccionado el preset numero 11
return

Preset12:
msgbox, se ha seleccionado el preset numero 12
return






changePresetName2(x) {
;Gosub, submitPreset
if (SelectedPreset = "") {
    msgbox, no se seleccionó ningun elemento
} else {
    IniWrite, %SelectedPreset%, AHK_PR_Presets.ini, PRESETS, %x%Preset
}
}
return










addPreset(presetName) {
coordmode, pixel, screen
coordmode, mouse, screen
coordmode, Caret, screen

BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On

MouseGetPos, xposP, yposP

MouseClick, middle
;sendInput, {mButton} ;this will MIDDLE CLICK to bring focus to the panel underneath the cursor (which must be the timeline). I forget exactly why, but if you create a nest, and immediately try to apply a preset to it, it doesn't work, because the timeline wasn't in focus...? Or something. IDK.
sleep 5

sendInput, ^{F6}
sleep 10
sendInput, +f
sleep 10
sendInput, ^a
sleep 10
sendInput, ^x
sleep 10
MouseMove, %A_CaretX%, %A_CaretY%, 0 ;this moves the cursor, instantly, to the position of the caret.
sleep 5
;ControlGetPos, XX, YY, Width, Height, %classNN%, ahk_class %class%, SubWindow, SubWindow 
;MouseMove, XX-50, YY+13, 0 
;send, %presetName%
sendPresetName(presetName)
MouseMove, 13, 50, 0, R
/*
MouseGetPos, iconX, iconY, Window, classNN ;---now we have to figure out the ahk_class of the current panel we are on. It might be "DroverLord - Window Class14", but the number changes anytime you move panels around... so i must always obtain the information anew.
sleep 5
WinGetClass, class, ahk_id %Window% ;----------"ahk_id %Window%" is important for SOME REASON. if you delete it, this doesn't work.
;tooltip, ahk_class =   %class% `nClassNN =     %classNN% `nTitle= %Window%
;sleep 50
ControlGetPos, xxx, yyy, www, hhh, %classNN%, ahk_class %class%, SubWindow, SubWindow ;;-I tried to exclude subwindows but I don't think it works...?
MouseMove, www/4, hhh/2, 0, R ;-----------------moves to roughly the CENTER of the Effects panel. Clicking here will clear the displayed presets from any duplication errors. VERY important. Without this, the script fails 20% of the time. This is also where the script can go wrong, by trying to do this on the timeline, meaning it didn't get the Effects panel window information as it should have.
sleep 5
MouseClick, left, , , 1 ;-----------------------the actual click
sleep 5
MouseMove, iconX, iconY, 0 ;--------------------moves cursor BACK onto the preset's icon
;tooltip, should be back on the preset's icon
sleep 5
;;+++++If this bug is ever resolved, then the lines ABOVE are no longer necessary.++++++
*/
sleep 10

MouseClickDrag, Left, , , %xposP%, %yposP%, 0 ;---clicks the left button down, drags this effect to the cursor's pervious coordinates and releases the left mouse button, which should be above a clip, on the TIMELINE panel.
sleep 5

sendInput, ^{F5}
MouseClick, middle


blockinput, MouseMoveOff ;returning mouse movement ability
BlockInput, off 
return
}


#IfWinActive



