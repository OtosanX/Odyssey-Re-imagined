'AB BOSS 
Sub Main()


    If GetFlag(195) > 0 Then
	   SetFlag(195, GetFlag(195) - 1)
	end if


	If GetFlag(195) = 0 Then
		SetFlag(195,15)
		Dim A As Long
		For A = 0 to 19
			DespawnMonster(2130, A)
		Next A
	    
	MapMessage(2130, "test.", yellow)
    Spawnmonster(2130,408,5,5)
	Spawnmonster(2130,408,6,2)
end if

End Sub

