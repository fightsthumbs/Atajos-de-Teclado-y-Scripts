

; ^!c::  ; Ctrl+Alt+C
search_chords() {
    ; Obtener información de Spotify
    if WinExist("ahk_exe Spotify.exe")
    {
        WinGetTitle, spotifyTitle, ahk_exe Spotify.exe
        
        ; Verificar si hay una canción reproduciéndose
        if (spotifyTitle = "Spotify" || spotifyTitle = "Spotify Premium" || spotifyTitle = "")
        {
            MsgBox, No hay ninguna canción reproduciéndose en Spotify
            return
        }
        
        ; Limpiar el título (quitar "Spotify" si está al final)
        songInfo := RegExReplace(spotifyTitle, " - Spotify$", "")
        
        ; Agregar "chords" a la búsqueda
        searchQuery := songInfo . " chords"
        
        ; Codificar la búsqueda para URL
        searchQuery := StrReplace(searchQuery, " ", "+")
        searchQuery := StrReplace(searchQuery, "&", "%26")
        
        ; Abrir Google con el primer resultado (usando "I'm Feeling Lucky")
        Run, https://www.google.com/search?q=%searchQuery%&btnI=1
    }
    else
    {
        MsgBox, Spotify no está abierto
    }
    return
}

; Tecla alternativa: Ctrl+Shift+C
;^+c::
spotify_search_2() {
    if WinExist("ahk_exe Spotify.exe")
    {
        WinGetTitle, spotifyTitle, ahk_exe Spotify.exe
        
        if (spotifyTitle = "Spotify" || spotifyTitle = "Spotify Premium" || spotifyTitle = "")
        {
            MsgBox, No hay ninguna canción reproduciéndose en Spotify
            return
        }
        
        songInfo := RegExReplace(spotifyTitle, " - Spotify$", "")
        searchQuery := songInfo . " chords"
        searchQuery := StrReplace(searchQuery, " ", "+")
        searchQuery := StrReplace(searchQuery, "&", "%26")
        
        ; Esta versión abre los resultados de búsqueda normales
        Run, https://www.google.com/search?q=%searchQuery%
    }
    else
    {
        MsgBox, Spotify no está abierto
    }
    return
}