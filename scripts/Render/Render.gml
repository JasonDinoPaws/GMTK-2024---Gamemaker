/// HorAlin - Left,Center,Right
/// Vertalin - Top,Center,Bottom
function RenderText(Text = "",start = 0,top = 0,size = 7,HorAlin = "Left",Vertalin = "Top",spaceing = 2,Color = c_white)
{
	Left = start
	Top = top
	Size = size 
	color = Color
	Spaceing = spaceing
	covert = [
		[".","dot"],
		[",","comman"],
		["-","minus"],
		["\'","quoat"],
		["\"","quoat"],
		["<","less"],
		[">","great"],
		[":","colon"],
	]
	
	if HorAlin == "Center"
		Left = start-((string_length(Text)/2)*Size)-((string_length(Text)/2)*Spaceing)
	else if HorAlin == "Right"
		Left = start-(string_length(Text)*Size)-(string_length(Text)*Spaceing)
	
	if Vertalin == "Center"
		Top = top-(Size/2)
	else if Vertalin == "Bottom"
		Top = top-Size
	
	split = []
	if is_array(Text)
		split = Text
	else
	{
			for (var t = string_length(Text);t > 0;t--)
			{
				array_insert(split,0,string_char_at(Text,t))
			}
	}
	
	array_foreach(split,function(n,ix)
	{
		Letter = n
		array_foreach(covert,function(tab,_)
		{
			if tab[0] == Letter
				Letter = tab[1]
		})
		
		sprite = asset_get_index("_"+string_lower(Letter))
		if sprite > -1
			draw_sprite_ext(
				sprite,
				-1,
				Left,
				Top,
				Size/7,
				Size/7,
			0,color,1)
		
		Left += Size+Spaceing
	})
	return Left+Size
}

function RenderGrid(Objs = ["Hello"],x1,x2,top,RowCells = 2,CellSize = [1,1],Offset = [2.5,2.5],Fun = function(Obj,ix,x1,y1,x2,y2){},Type = "Center")
{
	left = ((x1+x2)/2)-((RowCells/2)*CellSize[0])-((RowCells/2)*Offset[0])
	if Type == "Left"
		left = x1
	row = 0
	
	for (var i = 0; i < array_length(Objs); i ++)
	{
		Xcell = i-(row*RowCells)
		
		x1 = left+(Xcell*CellSize[0])+(Xcell*Offset[0])
		y1= top+(CellSize[1]*row)+(Offset[1]*row)
		x2 = x1+CellSize[0]
		y2 = y1+CellSize[1]
		Fun(Objs[i],i,  x1,y1,x2,y2)
		
		if Xcell+1 == RowCells
			row++
	}
}

function RenderButton(x1,y1,x2,y2,Text,Color = c_dkgray,Clicked = false,Clickfun = function(){show_debug_message("Clicked")})
{
	window_set_cursor(NaN)
	IsOver = mouse_x > x1 and mouse_x < x2 and mouse_y > y1 and mouse_y < y2 
	
	draw_rectangle_color(x1,y1,x2,y2,Color,Color,Color,Color,false)
	RenderText(Text,(x1+x2)/2,(y1+y2)/2,28,"Center","Center",0,c_white)

	if IsOver
	{
		window_set_cursor(cr_handpoint)
		draw_set_alpha(.25)
		draw_rectangle_color(x1,y1,x2,y2,c_black,c_black,c_black,c_black,false)
	}
	
	
	draw_set_alpha(1)
	if Clicked
		Clickfun()
}