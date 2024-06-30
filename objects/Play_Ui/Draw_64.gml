rw = room_width
rh = room_height

if Open
{
	x1 = rw-200
	y1 = 0
	x2 = rw 
	y2 = rh
	pad = 5
	
	RenderButton(x1-20,y1,x1,y2,">",c_gray,mouse_check_button_pressed(mb_left),function(){Open = false})
	draw_rectangle_color(x1,y1,x2,y2,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
	
	RenderGrid(["Cash","Mana","Towers"],x1+pad,x2-pad,y1+pad,1,[((x2-pad)-(x1+pad)),30],[0,10],function(obj,ix, px1,py1,px2,py2){
		if obj == "Cash"
		{
			draw_sprite_ext(_cash,-1,px1,py1,4,4,0,c_white,1)
			RenderText("000",px1+31,py1,21,"Left","Top",3,c_white)
		}
		else if obj == "Mana"
		{
			RenderText("Mana",(px1+px2)/2,py1,14,"Center","Top",2,c_white)
			draw_healthbar(px1,py1+17.5,px2,py2,50,c_navy,c_blue,c_blue,0,true,false)
		}
		else if obj == "Towers"
		{
			RenderText("Towers",(px1+px2)/2,py1,21,"Center","Top",2,c_white)
		}
	})
}
else
{
	RenderButton(rw-20,0,rw,rh,"<",c_gray,mouse_check_button_pressed(mb_left),function(){Open = true})
}