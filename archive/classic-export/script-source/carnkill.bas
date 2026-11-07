Function Main(Killer as Long, Killed as Long) AS LONG
dim Loop as Long, Count as Long

RunScript1("GameWarp", Killed)
SetPlayerFlag(Killed, 10, 0)
SetPlayerGuild(Killed, GetPlayerFlag(Killed, 5))
RunScript1("Sprite", Killed)

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerFlag(Loop, 10) = 1 Then
			Count = Count + 1
		End If
	End If
Next Loop

If Count = 1 Then
	GlobalMessage(strcat(strcat(GetPlayerName(Killer), " has slain "), strcat(GetPlayerName(Killed), " and won Carnage!")), BrightGreen)
	RunScript1("GameWarp", Killed)
	RunScript1("GameWarp", Killer)
	GiveObj(Killer, 484, 1)
	SetPlayerFlag(Killer, 10, 0)
	SetPlayerGuild(Killer, GetPlayerFlag(Killer, 5))
	RunScript1("Sprite", Killer)
Else
	GlobalMessage(strcat(strcat(GetPlayerName(Killer), " has slain "), strcat(GetPlayerName(Killed), " in Carnage!")), BrightRed)
End If

End Function