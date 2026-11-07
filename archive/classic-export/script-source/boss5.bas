Sub Main(Player as Long)
Dim Map as Long, X as Long, Y as Long
Dim CalcX as Long, CalcY as Long, A as Long

Map = 90
X = GetMonsterX(Map, 0)
Y = GetMonsterY(Map, 0)
	
For A = 1 To GetMaxUsers()
	If GetPlayerMap(A) = Map Then
		CalcX = Abs(GetPlayerX(A) - X)
		CalcY = Abs(GetPlayerY(A) - Y)
		If CalcX < 4 & CalcY < 4 Then
			MonsterMagicAttackPlayer(Map, 0, A, 10)
			CreateCharacterEffect(GetPlayerMap(A), A, 39, 80, 8, 0, 0)
		End If
	End If
Next A

End Sub