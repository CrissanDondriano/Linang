var _anim_length = 9;
var _frame_size = 64;
var _anim_speed = 12;

switch(facing) {
	case dir.left:  y_frame = 9; break;
	case dir.right: y_frame = 11; break;
	case dir.up:	y_frame = 8; break;
	case dir.down:  y_frame = 10; break;
	case -1:		x_frame = 0; break;
}

var _xx = x-x_offset;
var _yy = y-y_offset;

if(spr_shadow != -1) draw_sprite(spr_shadow, 0, x, y);
// Character Base
if(spr_base != -1) draw_sprite_part(spr_base, 0, floor(x_frame)*_frame_size, y_frame*_frame_size, _frame_size, _frame_size, _xx , _yy);

// Character Feet
if(spr_feet != -1) draw_sprite_part(spr_feet, 0, floor(x_frame)*_frame_size, y_frame*_frame_size, _frame_size, _frame_size, _xx, _yy);

// Character Legs
if(spr_legs != -1) draw_sprite_part(spr_legs, 0, floor(x_frame)*_frame_size, y_frame*_frame_size, _frame_size, _frame_size, _xx, _yy);

// Character Shirt
if(spr_torso != -1) draw_sprite_part(spr_torso, 0, floor(x_frame)*_frame_size, y_frame*_frame_size, _frame_size, _frame_size, _xx, _yy);

// Character Hair
if(spr_hair != -1) draw_sprite_part(spr_hair, 0, floor(x_frame)*_frame_size, y_frame*_frame_size, _frame_size, _frame_size, _xx, _yy);

if(x_frame < _anim_length -1) {
x_frame += _anim_speed/60;
} else {
	x_frame = 0;
}

// draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow,c_yellow,c_yellow,c_yellow, true);