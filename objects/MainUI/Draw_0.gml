rw = room_width
rh = room_height
Frame ++
if Frame >= room_speed
	Frame = 0


switch (UIOpened)
{
	case 0:
		draw_sprite_ext(Logo,-1,(rw/2)/2,rh/3,3,3,0,c_white,1)
		RenderGrid([PlayButton,SettingsButton,ExitButton],rw/3,rw,100,1,[0,sprite_get_height(PlayButton)*5],[0,25],function(obj,ix, x1,y1,x2,y2){
			RenderButton(obj,Frame/16,(x1+x2)/2,(y1+y2)/2,5,5,0,c_white,1,,struct_get(Buttons,sprite_get_name(obj)))
		})
	break;
	
	case 1:
	break;
	
	case 2:
		RenderButton(Back,Frame/16, rw/2,15, 4,4, 0,c_white,1,,function(){UIOpened = 0})
	break;
	
}
