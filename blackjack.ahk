; 1::Mousemove,0,92,0,R
; 2::Click
; 3::Mousemove,0,-92,0,R
; q::Mousemove,0,56,0,R
; w::Click
; e::Mousemove,0,-56,0,R

#IfWinActive, OSBuddy
Esc::suspend
^Esc::pause
^r::reload
#IfWinActive, OSBuddy
+z::knock()
#IfWinActive, OSBuddy
+x::pickpocket()
#IfWinActive, OSBuddy
+c::enchant_ruby()
^v::alch()
#IfWinActive, OSBuddy
LAlt::quickalch()
#IfWinActive, OSBuddy
XButton1::flick_mage()
#IfWinActive, OSBuddy
XButton2::flick_range()
#IfWinActive, OSBuddy
space::flick_pray()
#IfWinActive, OSBuddy
^s::splash()


global alch_x := 0, alch_y := 0, mage_tab_x := 0, mage_tab_y := 0, xpos1 := 0, xpos := 0, ypos := 0, ypos1 := 0
global pray_tab_x, pray_tab_y, mage_x, mage_y, mage_att_x, mage_att_y := 0
global range_x, range_y, range_att_x, range_att_y := 0
global invent_tab_x, invent_tab_y := 0
global minutespassed := 0

splash() {

while (minutespassed <= 360) {

   Send, /Hey youtube, %minutespassed% mins of splashing
   Send, {Enter} 
   Sleep 60000
   minutespassed++

}

}

flick_pray() {

   Click, %pray_tab_x%, %pray_tab_y%
   Sleep 600

   while not GetKeyState("space","P") {
	Click, %pray_tab_x%, %pray_tab_y%
	Random, sleepAmount, 1, 10
 	Sleep, sleepAmount
	Click, %pray_tab_x%, %pray_tab_y%
	new_sleep := 600 - sleepAmount
	Sleep, new_sleep

	}
 Click, %pray_tab_x%, %pray_tab_y%
 Sleep 1500

}


knock() {

	Click right
	randomsleep()
	Mousemove,0,92,0,R
	randomsleep()
	Click
	randomsleep()
	Mousemove,0,-92,0,R
	
}

pickpocket() {

	 Click right
	 randomsleep()
	 
	 Mousemove,0,56,0,R
	 randomsleep()
	 
	 Click
	 randomsleep()
	 Mousemove,0,-56,0,R
}

enchant_ruby() {

	mousemove -450,0,0, R
	randomsleep()
	
	click
	randomsleep()
	mousemove 450,0,0, R
	randomsleep()
	
	click
	randomsleep()

}

quickalch() {

	MouseGetPos, old_x, old_y

	Click, %tab_x%, %tab_y%
	randomsleep()

	Click, %alch_x%, %alch_y%
	randomsleep()


	Click, %alch_x%, %alch_y%
	randomsleep()
	
	mousemove old_x, old_y
}

alch() {

	MsgBox, Loop Started
	PixelGetColor, StartColor, %Xpos%, %ypos%
	;MsgBox, %StartColor%   The cursor is at X%xpos% Y%ypos%
	Loop
	{
	  ;PixelGetColor, Color, %Xpos%, %ypos%
	  ;MsgBox, %Color%  %StartColor%   X%xpos%   Y%ypos%
	  ;If (Color=StartColor) 
	  ;{
		Random, x_rand, 1,5
		Random, y_rand, 1,5
		jitter_x := xpos1 + x_rand
		jitter_y := ypos1 + y_rand
		Click, %jitter_x%, %jitter_y%
		Random, Sleeper, 1513,2014
		Sleep, %Sleeper%
	  ;}
	  ;Else
	  ;{
		;pause
	  ;} 
	}
}

randomsleep() {
 Random, sleepAmount, 10, 75
 Sleep, %sleepAmount%
}


^G::
MouseGetPos, xpos, ypos
MouseGetPos, mage_tab_x, mage_tab_y
Msgbox, The cursor is at X%xpos% Y%ypos%. 
return

^H::
MouseGetPos, xpos1, ypos1
MouseGetPos, alch_x, alch_y
Msgbox, The cursor is at X%xpos% Y%ypos%. 
return




;right
flick_mage() {

	MouseGetPos, old_x, old_y

	Click, %pray_tab_x%, %pray_tab_y%
	randomsleep()
	
	Click, %mage_x%, %mage_y%
	randomsleep()
	
	Click, %mage_att_x%, %mage_att_y%
	randomsleep()

	Click, %invent_tab_x%, %invent_tab_y%
	randomsleep()

	mousemove old_x, old_y
}

;left
flick_range() {

	MouseGetPos, old_x, old_y

	Click, %pray_tab_x%, %pray_tab_y%
	randomsleep()
	
	Click, %range_x%, %range_y%
	randomsleep()
	
	Click, %range_att_x%, %range_att_y%
	randomsleep()

	Click, %invent_tab_x%, %invent_tab_y%
	randomsleep()

	mousemove old_x, old_y
}

^Numpad0::
MouseGetPos, pray_tab_x, pray_tab_y
Msgbox, Pray Tab set X%pray_tab_x% Y%pray_tab_y%. 
return

;mage_x, mage_y, mage_att_x, mage_att_y
^Numpad1::
MouseGetPos, mage_x, mage_y
Msgbox, Magic overhead set X%mage_x% Y%mage_y%. 
return

^Numpad2::
MouseGetPos, mage_att_x, mage_att_y
Msgbox, Magic bonus set at X%mage_att_x% Y%mage_att_y%. 
return

;range_x, range_y, range_att_x, range_att_y
^Numpad4::
MouseGetPos, range_x, range_y
Msgbox, Range overhead set X%range_x% Y%range_y%. 
return

^Numpad5::
MouseGetPos, range_att_x, range_att_y
Msgbox, Range bonus set X%range_att_x% Y%range_att_y%. 
return

^Numpad7::
MouseGetPos, invent_tab_x, invent_tab_y 
Msgbox, Inventory set X%invent_tab_x% Y%invent_tab_y%. 
return