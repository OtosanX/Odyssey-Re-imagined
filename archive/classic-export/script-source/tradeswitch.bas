Sub Main(Player as Long, A As Long)
	Dim B as Long, C as Long, D as Long, F as Long
	If GetPlayermap(Player) = 305 & getplayerx(Player) = 4 & getplayery(Player) = 1 Then
	If GetPlayermap(A) = 305 & getplayerx(a) = 7 & getplayery(a) = 1 Then
		Dim E As Long
		E = 0
		For B = 0 to 49
			C = GetObjX(305, B)
			D = GetObjY(305, B)
			F = GetObjNum(305, B)
			If F > 0 & C = 4 & D = 1 Then
				E = 1
			End If
			If F > 0 & C = 7 & D = 1 Then
				E = 1
			End If
		Next B
		
		If E = 1 Then
			MapMessage(305, "Do not drop items on the blue tiles.", WHITE)
		Else
			playerwarp(player, 305, 9,2)
			playerwarp(a, 305, 2,2)
		End If
	End If
	End If
End Sub