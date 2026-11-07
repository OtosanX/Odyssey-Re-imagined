SUB Main(Player AS LONG)
	If GetPlayerEquipped(Player, 1) = 0 Then
		PlayerWarp(Player, 678, 5, 5)
		PlayerMessage(Player, "You must get your equipment before you proceed!", BRIGHTRED)
		Exit Sub
	End If
	
	PlayerMessage(Player, "Hail, friend!  The place is being overrun by monsters!  To fight them, face the monster and press Ctrl.", BRIGHTRED)
	If GetPlayerClass(Player) = 2 Then
		PlayerMessage(Player, "Since you are a mage, you have magic spells!  Click your 'Magic' tab on the interface, and double click a spell to use it!", BRIGHTBLUE)
	End If
END SUB