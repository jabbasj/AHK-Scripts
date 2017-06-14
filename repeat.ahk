#MaxThreadsPerHotkey 2

!1::    ;; alt + 1
suspend
pause
return

$1::

while GetKeyState("1","P") {
	Send 1
	Sleep 50
}

return

!2::    ;; alt + 2
suspend
pause
return

$2::

while GetKeyState("2","P") {
	Send 2
	Sleep 50
}

return