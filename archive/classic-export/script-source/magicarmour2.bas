Function Main(Player as Long) AS LONG

If GetPlayerEquipped(Player, 5) = 120 Then
	SetEquippedItemSuffix(Player, 5, 255)
End If

End Function