rw = room_width
rh = room_height

draw_sprite_ext(Logo,-1,rw/2,rh/2-25-sprite_get_height(Logo),3,3,0,c_white,Alpha)
RenderGrid(["Game made by","JasonDinoPaws","A-Nerd","DragonE"],0,rw,rh/2+25,1,[rw,25],[0,25],function(obj,ix, x1,y1,x2,y2){
	RenderText(obj,(x1+x2)/2,(y1+y2)/2,y2-y1,y2-y1,5,["Center","Center"],c_white,Alpha)
})

if Alpha == 0 and 3 <= (current_time/room_speed)-Time
	GameStarted()
else if Time <= (current_time/room_speed) and Alpha != 0
{
 Alpha -= .05
 Time += 1
}