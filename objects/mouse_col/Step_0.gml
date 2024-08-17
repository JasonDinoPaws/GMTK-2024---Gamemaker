/// @description Insert description here
// You can write your code in this editor
x = mouse_x;
y = mouse_y;

global.mouse_dif_x = mouse_x - mouse_x_last;
global.mouse_dif_y = mouse_y - mouse_y_last;

mouse_x_last = mouse_x;
mouse_y_last = mouse_y;