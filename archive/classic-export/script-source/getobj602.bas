FUNCTION Main(Player AS LONG) AS LONG
if getplayeraccess(player) = 0 then

	mapmessage(2112, (strcat(getplayername(player), " has picked up Lavos' Chest!")),brightgreen)
	Main = Continue
	
else
	main = continue
end if

END FUNCTION