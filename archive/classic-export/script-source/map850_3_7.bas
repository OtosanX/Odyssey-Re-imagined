Function Main(Player as Long) AS LONG

If GetPlayerEquipped(Player, 1) = 463 Then	''Staff
	If HasObj(Player, 78) >= 30 Then
		PlayerMessage(Player, "You drop the Scorpian Stings into the water and dip the staff. Suddenly there is a great flash as your staff is imbued with ancient power!", White)
		TakeObj(Player, 78, 30)
		SetEquippedItemPrefix(Player, 1, 44)
		SetEquippedItemSuffix(Player, 1, 249)
		CreateCharacterEffect(GetPlayerMap(Player), Player, 40, 40, 8, 0, 0)
		PlayerWarp(Player, 850, 3, 8)
	Else
		PlayerMessage(Player, "To imbue this staff it is required that the water be amalgamated with the Stings of Scorpians.", White)
	End If
Else
	PlayerMessage(Player, "You require a staff to imbue.", Grey)
End If

PlayerWarp(Player, 850, 3, 8)

End Function