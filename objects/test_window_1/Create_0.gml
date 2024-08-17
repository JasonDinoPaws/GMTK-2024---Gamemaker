border_x1 = x - 100;
border_y1 = y + 100;

border_x2 = x+100;
border_y2 = y-100;
tmp_var = false;
tmp_var2 = false;
tmp_var3 = false;
function grab_thing(touch_bool){
	if touch_bool && mouse_check_button(mb_left){
		return true;
		tmp_var = true;
	} else if mouse_check_button(mb_left) && tmp_var{
		return true
	}
	else if mouse_check_button_released(mb_left){
		tmp_var = false
	}
}

