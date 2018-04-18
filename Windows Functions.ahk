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



;=========================================Keystroke R cclick==========================================

; I use this in case to cloase a script when mouse is stuck while using AHK

^+F1::
Send {RButton}
Return

;=========================================Copy all files from a folder===========================

;This copies all files(as seen in explorer) from a folder to then currently active window

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


; I find this much simple than all the registry messing scripts

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
