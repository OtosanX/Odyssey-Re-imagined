Function Main(Player as Long, Target as Long) as Long
dim Map as Long, Gate as Long
Map = GetPlayerMap(Player)

'Tof
If Map = 66 | Map = 67 | Map = 85 | Map = 87 | Map = 88 | Map = 91 | Map = 93 | Map = 98 | Map = 148 | Map = 167 | Map = 231 | Map = 232 Then Gate = 1
'Champ
If Map = 1828 | Map = 1829 Then Gate = 1
'Football
If Map = 1423 | Map = 1424 | Map = 1425 Then Gate = 1
'Dodgeball
If Map = 1427 Then Gate = 1

If Gate = 1 Then
	Main = Stop
Else
	Main = Continue
End If

End Function