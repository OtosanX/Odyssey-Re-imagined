Sub Main(Killer as Long, Killed as Long)
dim Loop as Long

GlobalMessage(strcat(GetPlayerName(Killer), strcat(" has won the Tournament for ", strcat(str(GetFlag(179)), " Gold!!"))), BrightGreen)
PlayerWarp(Killer, 1883, 1, 7)
GiveObj(Killer, 6, GetFlag(179))
PlayerWarp(Killed, 1883, Random(2) + 10, Random(2) + 6)
RunScript1("Restore", Killer)
RunScript1("Restore", Killed)
SetPlayerFlag(Killer, 10, 0)
SetPlayerFlag(Killed, 10, 0)
SetPlayerFlag(Killer, 11, 0)
SetPlayerFlag(Killed, 11, 0)
SetPlayerGuild(Killer, GetPlayerFlag(Killer, 5))
SetPlayerGuild(Killed, GetPlayerFlag(Killed, 5))
For Loop = 170 To 179
	SetFlag(Loop, 0)
Next Loop

End Sub