FUNCTION Main(Player AS LONG) AS LONG
   If HasObj(Player, 505) Then
		Main = Stop
	Else
		Main = Continue
	End If
END FUNCTION