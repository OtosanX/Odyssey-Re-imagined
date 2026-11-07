SUB Main(Player AS LONG)

	Dim A AS LONG
	For A = 1 to 5
		If GetPlayerEquipped(Player, A) > 0 Then
			PlayerMessage(Player, "You must unequip all your items first!", WHITE)
			Exit Sub
		End If
	Next A
If HasObj(Player,164) Then
If HasObj(Player,27) Then
If HasObj(Player,14) Then
If HasObj(Player,24) Then
If HasObj(Player,25) Then
If HasObj(Player,26) Then
If HasObj(Player,28) Then 
If HasObj(Player,95) Then
If HasObj(Player,99) Then
If HasOBj(Player,121) Then
If HasOBj(Player,134) Then
If HasObj(Player,209) Then
If HasObj(Player,85) >= 30 Then
TakeObj(Player,164,1)
TakeObj(Player,27,1)
TakeObj(Player,14,1)
TakeObj(Player,24,1)
TakeObj(Player,25,1)
TakeObj(Player,26,1)
TakeObj(Player,28,1)
TakeObj(Player,95,1)
TakeObj(Player,99,1)
TakeObj(Player,121,1)
TakeObj(Player,134,1)
TakeObj(Player,209,1)
TakeObj(Player,85,30)
GiveObj(Player,96,1)
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