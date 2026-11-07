Sub Main(Player as Long)
dim Loop as Long, Count as Long
Count = 0

For Loop = 1 To GetMaxUsers()
	If GetPlayerAccess(Loop) = 0 & GetPlayerFlag(Player, 78) = 0 Then
		If GetPlayerMap(Loop) = 68 Then Count = Count + 1
	End If
Next Loop

MapMessage(68, strcat("Carnage Population: ", str(Count)), Yellow)

End Sub