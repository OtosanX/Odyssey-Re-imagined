Sub Main(Player as Long, Parm1 as Long)

Select Case Parm1
	Case 0
		PlayerMessage(Player, "==Warp Locations==", Yellow)
		PlayerMessage(Player, "1. Crendale", White)
		PlayerMessage(Player, "2. Dragonia", White)
		PlayerMessage(Player, "3. Babylon", White)
		PlayerMessage(Player, "4. Desert", White)
		PlayerMessage(Player, "5. Summit Town", White)
	Case 1
		PlayerWarp(Player, 107, 6, 2)
		PlayerMessage(Player, "You have warped to Crendale.", White)
	Case 2
		PlayerWarp(Player, 114, 6, 7)
		PlayerMessage(Player, "You have warped to Dragonia.", White)
	Case 3
		PlayerWarp(Player, 1206, 6, 8)
		PlayerMessage(Player, "You have warped to Babylon.", White)
	Case 4
		PlayerWarp(Player, 139, 2, 9)
		PlayerMessage(Player, "You have warped to the Desert.", White)
	Case 5
		PlayerWarp(Player, 658, 5, 8)
		PlayerMessage(Player, "You have warped to Summit Town.", White)
	Case Else
		PlayerMessage(Player, "Invalid Location.", Yellow)
End Select

End Sub