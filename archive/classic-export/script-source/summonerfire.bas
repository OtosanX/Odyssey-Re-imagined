Function Main(Player as Long) AS LONG
dim Map as Long, X as Long, Y as Long, Monster as Long
dim RangeX as Long, RangeY as Long

Map = GetPlayerMap(Player)
If Map <> 1489 Then Exit Function
If GetFlag(93) > 1 Then Exit Function

If GetFlag(92) = 0 Then
	PlayerMessage(Player, "The Beast becomes infuriated and pounds the ground!", White)
End If

If GetFlag(92) < 3 Then
	Timer(Player, 3, "summonerfire2")
End If

End Function