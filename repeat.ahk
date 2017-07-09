#MaxThreadsPerHotkey 2


#ifWinActive World of Warcraft
{

!1::    	;; alt + 1 = toggle script
suspend
pause
return

$1::		;; hold 1 = spams 1

while GetKeyState("1","P") {
	Send 1
	Sleep 50
}
return

!2::    	;; alt + 2 = toggle script
suspend
pause
return

$2::		;; hold 2 = spams 2

while GetKeyState("2","P") {
	Send 2
	Sleep 50
}
return

}

;; you can change the above keybinds for whatever you use
;; https://autohotkey.com/docs/KeyList.htm