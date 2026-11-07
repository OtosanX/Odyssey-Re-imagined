Sub Main(Player AS LONG)
	Dim A AS LONG
	For A = 1 to 20
		SpawnMonster(919, 136, Random(8) + 3, Random(8) + 3)
	Next A
End Sub