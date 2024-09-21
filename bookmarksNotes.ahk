; #SingleInstance, Force
; SendMode Input

#IfWinActive ahk_exe SumatraPDF.exe
F9::

    Send, ^c
    Sleep 50

WinGetTitle, bookTitle

{ ;;;ESTE FRAGMENTO DE CÓDIGO SE PODRÍA SIMPLIFICAR HACIENDO UNA FUNCIÓN EN EL ARCHIVO PDF_PASTE_FIX.AHK
    temp = %Clipboard%
    temp := RegExReplace(temp, "({a-z])-{`r`n]+", "$1")
    StringReplace, temp, temp, `r,,All
    StringReplace, temp, temp, `n,%A_SPACE%, All
    Clipboard = %temp%
}

bookName := SubStr(StrReplace(bookTitle, A_Space, ""), 1 , 10)
;;;MsgBox, ,, %bookName%
bookFileName :=  bookName . "_Notes.txt"
;;;MsgBox,,, %bookFileName%
bookNotes := FileOpen(bookFileName, "a") 
    ;;InputBox, var_mensaje, Title, Prompt
                                    
    FormatTime, var_fechayhora,, yyyyMMdd-HH:mm:ss ;;ISO 8601

    bookNotes.Write("`r`n" var_fechayhora "`r`n"  clipboard "`r`n")
    bookNotes.Close()
    ;SetWorkingDir %A_ScriptDir%
    ToolTip % "saved in " . bookFileName,     70, 70
    SetTimer, RemoveToolTip, -5000


return