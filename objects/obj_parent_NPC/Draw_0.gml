var _anim_length = 9;
var _frame_size = 64;
var _anim_speed = 12;

if(move_x < 0) y_frame = 9;
else if(move_x > 0) y_frame = 11;
else if(move_y < 0) y_frame = 8;
else if(move_y > 0) y_frame = 10;
else				x_frame = 0;

var _xx = x-x_offset;
var _yy = y-y_offset;


if(x_frame + (_anim_speed/60) < _anim_length) {
x_frame += _anim_speed/60;
} else {
	x_frame = 0;
}

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


// draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow,c_yellow,c_yellow,c_yellow, true);