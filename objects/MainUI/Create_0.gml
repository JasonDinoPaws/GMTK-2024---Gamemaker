UIOpened = 0
Frame = 0

Buttons = {
	PlayButton: function(){
		MainUI.UIOpened = 1
	},
	SettingsButton: function(){
		MainUI.UIOpened = 2
	},
	ExitButton: function(){
		game_end()
	}
}