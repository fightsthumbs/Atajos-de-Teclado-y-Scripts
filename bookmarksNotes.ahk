; #SingleInstance, Force
; SendMode Input

#IfWinActive ahk_exe SumatraPDF.exe



CopySelectedText() {
    Clipboard := ""
    Send, ^c
    ClipWait, 2
    ;Sleep 50

    { ;;;ESTE FRAGMENTO DE CÓDIGO SE PODRÍA SIMPLIFICAR HACIENDO UNA FUNCIÓN EN EL ARCHIVO PDF_PASTE_FIX.AHK
        temp = %Clipboard%
        temp := RegExReplace(temp, "({a-z])-{`r`n]+", "$1")
        StringReplace, temp, temp, `r,,All
        StringReplace, temp, temp, `n,%A_SPACE%, All
        Clipboard = %temp%
    }

    return Clipboard
}

GetBookName() {
    WinGetActiveTitle, WindowTitle
    
    ; Limpiar el título de la ventana para usarlo como nombre de archivo
    BookName := WindowTitle
    
    ; Remover caracteres no válidos para nombres de archivo
    BookName := RegExReplace(BookName, "[<>:""/\\|?*]", "")
    BookName := RegExReplace(BookName, " - SumatraPDF", "")
    
    ; Si el título está vacío o es muy corto, usar un nombre por defecto
    if (StrLen(BookName) < 3) {
        BookName := "Libro_" . A_Now
    }
    
    return BookName
}

GetBookPage() {
    ;;obtener el número de la página
    ControlGetText, bookCurrentPage, Edit1 
    
    return bookCurrentPage
}
;;;MsgBox,,, %bookFileName%


SaveFormattedText(text, format) {
    if (text = "") {
        return
    }
    NotesFolder := A_WorkingDir . "\BookNotes\"
      ; Cambia esta ruta por donde quieras guardar las notas
    FileExtension := ".md"
    FileCreateDir, %NotesFolder%
    
    BookName := GetBookName()
    FilePath := NotesFolder . "\" . BookName . FileExtension

    page := GetBookPage()
    
    ; Obtener timestamp
    FormatTime, TimeStamp, , yyyyMMdd-HH:mm:ss
    
    ; Aplicar formato según la tecla presionada
    if (format = "normal") {
        FormattedText := text
    } else if (format = "bold") {
        FormattedText := "**" . text . "**"
    } else if (format = "italic") {
        FormattedText := "*" . text . "*"
    } else if (format = "underline") {
        FormattedText := "<u>" . text . "</u>"
    }
    
    ; Crear entrada de nota
    NoteEntry := "`n`n---`n" . TimeStamp . " / page " . page . "`n" . FormattedText . "`n"
    
    ; Guardar en archivo
    FileAppend, %NoteEntry%, %FilePath%, UTF-8
    
    ; Mostrar notificación
    ToolTip % "saved in " . BookName,     70, 70
    SetTimer, RemoveToolTip, -5000

}
Variable := "Mensaje"
; Teclas de función para diferentes formatos

; F9 - Texto normal
F9::
    SelectedText := CopySelectedText()
    SaveFormattedText(SelectedText, "normal")
return

; F10 - Texto negrita
F10::
    SelectedText := CopySelectedText()
    SaveFormattedText(SelectedText, "bold")
return

; F11 - Texto cursiva
F11::
    SelectedText := CopySelectedText()
    SaveFormattedText(SelectedText, "italic")
return

; F12 - Texto subrayado
F12::
    SelectedText := CopySelectedText()
    SaveFormattedText(SelectedText, "underline")
return

; Hotkey adicional para abrir la carpeta de notas (Ctrl+Alt+N)
^!n::
    NotesFolder := A_WorkingDir . "\BookNotes\"
    Run, %NotesFolder%
return
