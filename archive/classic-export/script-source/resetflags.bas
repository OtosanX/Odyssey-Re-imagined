Sub Main(Player as Long)

SetPlayerFlag(Player, 2, 0) 'Broadcast Timer
SetPlayerFlag(Player, 3, 0) 'Unfreeze Timer
SetPlayerFlag(Player, 4, 0) 'Unfreeze
SetPlayerFlag(Player, 5, 0) 'Retain Guild
SetPlayerFlag(Player, 10, 0) 'Minigames
SetPlayerFlag(Player, 11, 0) 'Minigames Team
SetPlayerFlag(Player, 12, 0) 'Minigames Kills-Lives
SetPlayerFlag(Player, 13, 0) 'Staking Arena
SetPlayerFlag(Player, 15, 0) 'Can res
SetPlayerFlag(Player, 17, 0) 'Trade Room
SetPlayerFlag(Player, 30, 0) 'Arena warp flag
SetPlayerFlag(Player, 32, 0) 'Poisoner
SetPlayerFlag(Player, 69, 0)
SetPlayerFlag(Player, 81, 0) 'EMPTY (old carn cooldown)
SetPlayerFlag(Player, 95, 0) 'Carn
SetPlayerFlag(Player, 97, 0) 'Battle
SetPlayerFlag(Player, 98, 0) 'Titan Takedown
SetPlayerFlag(Player, 99, 0) 'TTD Lives
SetPlayerFlag(Player, 100, 0)
SetPlayerFlag(player, 109, 0) 'Push Timer
SetPlayerFlag(Player, 201, 0) 'Party number
SetPlayerFlag(Player, 202, 0) 'Party leader (1 = leader)
SetPlayerFlag(Player, 203, 0) 'Party invite
SetPlayerFlag(Player, 216, 0) 'Jims game
SetPlayerFlag(Player, 217, 0) 'Jims game
SetPlayerFlag(Player, 220, 0)

	'Buffs
SetPlayerFlag(Player, 121, 0) 'Cleric Agility
SetPlayerFlag(Player, 122, 0) 'Strength
SetPlayerFlag(Player, 123, 0) 'Endurance
SetPlayerFlag(Player, 124, 0) 'Constitution
SetPlayerFlag(Player, 126, 0) 'Intelligence

	'Spell Flags
SetPlayerFlag(player, 23, 0) 'Cooldowns
SetPlayerFlag(player, 25, 0) 'Invis
SetPlayerFlag(Player, 27, 0) 'Invis Cooldown
SetPlayerFlag(Player, 28, 0) 'Buff Cooldown
SetPlayerFlag(Player, 29, 0) 'Improve Thief Invis
SetPlayerFlag(Player, 90, 0) 'Resurrect
SetPlayerFlag(Player, 94, 0) 'Telepathy
SetPlayerFlag(Player, 208, 0) 'Cleric Damnation

CalculateStats(Player)

End Sub