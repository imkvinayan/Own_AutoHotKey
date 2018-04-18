#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force

;Make a Program Always on top

; Always on Top
^SPACE:: Winset, Alwaysontop, , A ; ctrl + space
Return

;Control+Shift automatically opens selected file in Notepad++---------------------------WORK IN PROGRESS

^+`::
Send {RButton}
Send {Down}
Send {Down}
Send {Down}
Send {Down}
Send {Down}
Send {Down}
Send {Down}
Send {Down}
Send {Enter}
Return


;TOGGLES FILE EXTENSIONS (in Windows Explorer)
;toggle extensions script - checks status of file extension viewing, toggles it, refreshes Explorer window.
#IfWinActive ahk_exe explorer.exe
!z::
Global lang_ToggleFileExt, lang_ShowFileExt, lang_HideFileExt
RootKey = HKEY_CURRENT_USER
SubKey  = Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
RegRead, HideFileExt    , % RootKey, % SubKey, HideFileExt
if HideFileExt = 1
  {
  RegWrite, REG_DWORD, % RootKey, % SubKey, HideFileExt, 0
  
  }
else
{
    RegWrite, REG_DWORD, % RootKey, % SubKey, HideFileExt, 1


return
}
#IfWinActive

; WINDOWS KEY + H TOGGLES HIDDEN FILES 
#h:: ;Win+H shortcut
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden  ;checks for hidden file status and changes
If HiddenFiles_Status = 2  
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1 
Else  
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2 
WinGetClass, eh_Class,A 
If (eh_Class = "#32770" OR A_OSVersion >= "WIN_VISTA") ;if your Windows OS is Vista or newer
send, {F5} 
Else PostMessage, 0x111, 28931,,, A 
  ;calls the refresh command agian so you see your results
Return
;end of hidden files mod


;=========================================Keystroke R cclick==========================================

^+F1::
Send {RButton}
Return

;=========================================Copy all files from a folder===========================



copyfile(from, titlee)
{
WinGetTitle, Title, A
;MsgBox, %Title%
Run, %from%
WinWait, %titlee%
WinMaximize, %titlee%
Send ^a
Sleep 100
Send ^c
Sleep 100
;MsgBox, copied
Send !{F4}
WinActivate, %Title%
WinWait, %Title%
;MsgBox, pasting
Send ^v
Return
}

^F10::
copyfile("G:\KeepVid Pro Downloaded", "KeepVid Pro Downloaded")

^F9::
copyfile("G:\Wondershare Video Converter Ultimate\Converted", "Converted")

;====================================File Extensions and Hidden Files Toggle====================================

^F12::

Send !v
Send hf
Send !h
MouseClick, left
Return



^F11::

Send !v
Send hh
Send !h
MouseClick, left
Return
