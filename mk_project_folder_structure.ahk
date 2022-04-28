#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;F1::
createFolderStructure(){
InputBox, ProjectName, Project name, Define a name for your project:,
FileSelectFolder, rootDir , StartingFolder, Options, Prompt
FormatTime, todaysDate, %A_Now%, yyyyMMdd
;send, %rootDir%%todaysDate%
;FileCreateDir, %rootDir%%ProjectName%_%todaysDate%
if (rootDir = "" or ProjectName = "") {
    MsgBox, no se ha indicado ninguna ruta
    ;return
} else {
    newDirectoryName = %rootDir%\%ProjectName%_%todaysDate%
    MsgBox, Se han creado una copia en la ruta indicada: %newDirectoryName%
    sleep 15
;;;;;;;;;;;;;Aca debe ir el template;;;;;;;;;;;Acá se copiaran los archivos
    FileCopyDir, D:\XXX_Default Folder Structure ,%newDirectoryName%
    ;return
}
return    
} 





/*



*/