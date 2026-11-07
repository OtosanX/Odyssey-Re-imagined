Function Main(Player AS LONG) AS LONG

'God Death
If GetPlayerAccess(Player) > 0 Then
	Main = Stop
'	Exit Function
End If

If GetPlayerFlag(Player, 120) > 0 Then
	RunScript1("debuff", Player)
End If

'Artifacts
	If HasObj(Player, 393) Then RunScript1("ArtifactSpawn", Player)
	If HasObj(Player, 389) Then RunScript1("ArtifactSpawn", Player)

'Battle Royal
If GetPlayerFlag(Player, 97) > 1 Then
	Main = Stop
	If GetPlayerGuild(Player) = 30 Then PlayerWarp(Player, 1421, 0, 1)
	If GetPlayerGuild(Player) = 31 Then PlayerWarp(Player, 1422, 11, 1)
End If

'Protect players under level 20 from losing their items
If GetPlayerLevel(Player) <= 20 Then
	SetPlayerStatus(Player, 0)
	PlayerMessage(Player, "The angel of mercy has protected you from losing your items and experience.", WHITE)
	PlayerMessage(Player, "To avoid death, stay along the roads and avoid attacking strong monsters or players until you become stronger!  For help on what quests to do, visit OdysseyClassic.com and view the quest guides!", WHITE)
	Main = Stop
	Exit Function
End If

'Sprite Reset on Death
If GetPlayerGuild(Player) = 0 Then
   SetPlayerSprite(Player, 0)
Else
   SetPlayerSprite(Player, GetGuildSprite(GetPlayerGuild(Player)))
End If

Main = Continue

End Function