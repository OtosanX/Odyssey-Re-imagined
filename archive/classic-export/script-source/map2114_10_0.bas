Sub Main(Player as Long)

If GetPlayerGuild(Player) > 0 Then	
if getplayerguild(player) = getflag(186) & getflag(185) > 0 then 




	dim Cost as Long
	Cost = 3


	Dim Effect as Long, Damage as Long, HP as Long

	Dim XCoord as Long, YCoord as Long, Loop as Long, MonsterLoop as Long
	
	dim xPos as long, yPos as long


	If HasObj(Player, 603) >= Cost Then

	TakeObj(Player, 603, cost)




	playermessage(player, "The magic artillery pushes you back!", yellow)
	PlayerWarp(Player, 2114, 10, 2)
	CreateTileEffect(2114, 10, 0, 1, 100, 8, 0, 0)




	'Area of Effect - Mage Spell - Arcane Rain

	Effect = 45

	Damage = GetPlayerDamage(Player) + 5

	xPos = random(6)+6

	yPos = random(5)+6


	For Loop = 1 to GetMaxUsers()


	If IsPlaying(Loop) Then



		If GetPlayerMap(Loop) = getplayermap(player) Then



	

			for xCoord = 0 to 2

			for yCoord = 0 to 2

			

				if getplayerx(loop) = xpos +xCoord & getplayery(loop) = ypos + yCoord then

				


						CreateTileEffect(GetPlayerMap(Player), xpos +xCoord, ypos + yCoord, 45, 50, 6, 4, 0)
						MagicAttackPlayer(Player, Loop, Damage)

						

				end if

				

			next xCoord

			next yCoord







		End If



	End If



	Next Loop


	For XCoord = 0 to 2

		For YCoord = 0 to 2





			CreateTileEffect(getplayermap(player), xpos+xcoord, ypos+ycoord, Effect, 33, 10, 0, 0)



		Next YCoord



	Next XCoord








	ELSE

	PlayerMessage(Player, strcat("You need ", strcat(str(Cost), " Fort Ammo to continue.")), brightred)
	PlayerWarp(Player, 2114, 10, 1)
	end if


else
playermessage(player, "Your guild does not have special access to the Darkcone Fort.", white)
PlayerWarp(Player, 2114, 10, 1)
end if 


else
playermessage(player, "You are not in a guild.", white)
PlayerWarp(Player, 2114, 10, 1)
end if


END SUB


