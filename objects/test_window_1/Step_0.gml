border_x1 = 100 - x;
border_y1 = 100 + y;

border_x2 = 100 + x;
border_y2 = 100 - y;

var left_side = collision_line(border_x1,border_y1,border_x1,border_y2,mouse_col,false,false);



if grab_thing(left_side){
	show_debug_message(mouse_x);
}


var box = collision_rectangle(border_x1, border_y1, border_x2, border_y2, test_parent, false, false);

if box {box.visible = true;}