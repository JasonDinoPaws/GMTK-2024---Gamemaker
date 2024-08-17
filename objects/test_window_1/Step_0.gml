x = (border_x1+border_x2)/2
y = (border_y2+border_y1)/2
var right_side = collision_line(border_x2,border_y1,border_x2,border_y2,mouse_col,false,false);
var left_side = collision_line(border_x1,border_y1,border_x1,border_y2, mouse_col,false,false);
var bottom_side = collision_line(border_x1,border_y1,border_x2,border_y1,mouse_col,false,false);

if grab_thing(right_side){
	border_x2 = mouse_x;
}

if grab_thing(left_side){
	border_x1 = mouse_x;
}
if tmp_var3{
	border_y1 = mouse_y;
}


var box = collision_rectangle(border_x1, border_y1, border_x2, border_y2, test_parent, false, false);

if box {box.visible = true;}