global.RoomState = {
	"Main":0
}

function GameStarted()
{
	instance_destroy(Opening)
	instance_create_layer(0,0,"Instances",MainMenu)
	global.RoomState = 1
}