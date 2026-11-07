FUNCTION Main(Player AS LONG, Message AS String) AS LONG
	PlayerMessage(Player, "Normal text is only visible by people on your current map.  To talk to everyone in the game, use broadcast by typing /b <message>!", BRIGHTRED)
	Main = Continue
END FUNCTION