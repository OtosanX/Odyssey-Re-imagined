SUB Main(Player AS LONG)

	Dim A AS LONG
	For A = 1 to 5
		If GetPlayerEquipped(Player, A) > 0 Then
			PlayerMessage(Player, "You must unequip all your items first!", WHITE)
			Exit Sub
		End If
	Next A
If HasObj(Player,164) Then
If HasObj(Player,11) Then
If HasObj(Player,18) Then
If HasObj(Player,19) Then
If HasObj(Player,117) Then
If HasObj(Player,162) Then
If HasObj(Player,195) Then 
If HasObj(Player,205) Then
If HasObj(Player,105) Then
If HasOBj(Player,106) Then
If HasOBj(Player,107) Then
If HasObj(Player,108) Then
If HasObj(Player,109) Then
TakeObj(Player,164,1)
TakeObj(Player,11,1)
TakeObj(Player,18,1)
TakeObj(Player,19,1)
TakeObj(Player,117,1)
TakeObj(Player,162,1)
TakeObj(Player,195,1)
TakeObj(Player,205,1)
TakeObj(Player,105,1)
TakeObj(Player,106,1)
TakeObj(Player,107,1)
TakeObj(Player,108,1)
TakeObj(Player,109,1)
GiveObj(Player,247,1)
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
Else
PlayerMessage(Player,"You do not have all of the required ingredients.",white)
End if
END SUB