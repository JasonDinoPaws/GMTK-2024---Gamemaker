border_x1 = 100 - x;
border_y1 = 100 + y;

border_x2 = 100 + x;
border_y2 = 100 - y;

function grab_thing(touch_bool){
	if touch_bool && mouse_check_button(mb_left){
		return true;
	} else {return false;}
}