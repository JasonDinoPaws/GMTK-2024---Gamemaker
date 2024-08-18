global.Textures = {}

/*
global.letterconverts = [
	[".","dot"],
	[",","comma"],
	["+","add"],
	["-","minus"],
	["=","equal"],
	["_","uscore"],
	["\'","quoat"],
	["\"","quotDuble"],
	["?","quest"],
	["<","than"],
	[",","comma"],
	[" =","col"],
	[";","semicol"],
	["/","slash"],
	["[","brake"]
]*/

array_foreach([],function(el,_){show_debug_message(string(ord(el))+"|"+el)})
function RenderLeter(Letter = "",Left = 0,Top = 0,XSize = 7,YSize = 7,Color = c_white, Alpha = 1)
{
		sprite = asset_get_index("_"+string_lower(Letter))
		
		if sprite == -1 and asset_get_index("_"+string(ord(Letter)))
		{
			sprite = asset_get_index("_"+string(ord(Letter)))
			XSize = sprite_get_width(sprite)*(XSize/sprite_get_height(sprite))
		}
		
		if sprite > -1
			draw_sprite_ext(sprite,-1,Left,Top,XSize/sprite_get_width(sprite),YSize/sprite_get_height(sprite),0,Color,Alpha)
			
		return [XSize,YSize]
}
function RenderText(Text = "",Left = 0,Top = 0,XSize = 7,YSize = 7,Spaceing = 2,Alignment = ["Left","Top"],Color = c_white, Alpha = 1)
{
	if is_array(Text)
	{
		NText = ""
		for (var t = 0;t < array_length(Text);t++)
			NText += string(Text[t])
		Text = NText
	}
	
	if Alignment[0] == "Center"
		Left = Left-((string_length(Text)/2)*XSize)-((string_length(Text)/2)*2)
	else if Alignment[0] == "Right"
		Left = Left-(string_length(Text)*XSize)-(string_length(Text)*2)
		
	if Alignment[1] == "Center"
		Top = Top-(YSize/2)
	else if Alignment[1] == "Bottom"
		Top = Top-YSize*array_length(string_split(Text,"\n"))
	
	
	for (var t = 1;t <= string_length(Text);t++)
	{
		Size = RenderLeter(string_char_at(Text,t),Left,Top,XSize,YSize,Color,Alpha) 
		Left += Size[0]+Spaceing
	}
	return [Left,Top]
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

function RenderButton(img,sub=0, x=0,y=0, xscale=1,yscale=1, rotation=0,color=c_white,alpha=1, input=mouse_check_button(mb_left),callback=function(){show_debug_message("Pressed")})
{
	if img
	{
		xsize = sprite_get_width(img)*xscale
		ysize = sprite_get_height(img)*yscale
		xoff = sprite_get_xoffset(img)
		yoff = sprite_get_yoffset(img)
		
		x1 = x - (xoff*xscale)
		y1 = y - (yoff*yscale)
		x2 = x1+xsize
		y2 = y1+ysize
		isOver = x1 <= mouse_x and mouse_x <= x2 and y1 <= mouse_y and mouse_y <= y2

		draw_sprite_ext(img,sub,x,y,xscale,yscale,rotation,color,alpha)
		
		if input and isOver
			callback()
	}
}