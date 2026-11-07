Function Main(Player as Long) AS LONG
dim Map as Long, Flag as Long

Map = 90
Flag = 100

If GetMonsterHP(Map, 0) < 250 Then
	If GetFlag(50) = 0 Then
		SetFlag(50, 1)
		'Spell 1
	End If
End If
If GetMonsterHP(Map, 0) < 150 Then
	If GetFlag(50) = 1 Then
		SetFlag(50, 2)
		'Spell 2
	End If
End If
If GetMonsterHP(Map, 0) < 150 Then
	If GetFlag(50) = 2 Then
		SetFlag(50, 3)
		'Spell 3
	End If
End If

If GetMonsterHP(Map, 0) = 1 Then RunScript0("Boss6")

Main = Continue
End Function