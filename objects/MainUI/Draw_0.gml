rw = room_width
rh = room_height
draw_sprite_ext(Logo,-1,(rw/2)/2,rh/3,3,3,0,c_white,1)

RenderGrid([PlayButton,SettingsButton,ExitButton],rw/2,rw,25,1,[0,sprite_get_height(PlayButton)*3],[0,25],function(obj,ix, x1,y1,x2,y2){
	draw_sprite_ext(obj,-1,(x1+x2)/2,(y1+y2)/2,3,3,0,c_white,1)
})