var _move_cam = keyboard_check(ord("C"));

if(_move_cam){
	x += (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * 5;
	y += (keyboard_check(ord("W")) - keyboard_check(ord("S"))) * 5;
} else {
	x = clamp(x, following.x-h_border, following.x+h_border);
	y = clamp(y, following.y-v_border, following.y+v_border);
}

