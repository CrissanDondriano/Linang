//variables
var _left_key = keyboard_check(vk_left) || external_left_press;
var _right_key = keyboard_check(vk_right) || external_right_press;
var _up_key = keyboard_check(vk_up) || external_up_press;
var _down_key = keyboard_check(vk_down) || external_down_press;
var _walk_key = keyboard_check(vk_control)
var _run_key = keyboard_check(vk_shift);
var _interact_key = keyboard_check_pressed(ord("E"));



//Alter Speed
if(_run_key){
	spd = r_spd;
}else if(_walk_key){
	spd = w_spd;
}else{
	spd = n_spd;
}

//Movement
move_y = (_down_key - _up_key) * spd;
if (move_y== 0){
	move_x = (_right_key - _left_key) * spd;
}

if(move_x != 0){
	switch(sign(move_x)) {
		case 1: facing = dir.right; break;
		case -1: facing = dir.left; break;
	}
} else if(move_y != 0){
	switch(sign(move_y)) {
		case 1: facing = dir.down; break;
		case -1: facing = dir.up; break;
	}
} else {
	facing = -1;
}
//Collision
//Horizontal
if(move_x != 0) {
	var collisionH = instance_place(x+move_x, y, obj_bochi_block);
	if(collisionH != noone and collisionH.collideable){
		repeat(abs(move_x)){
			if(!place_meeting(x+sign(move_x), y, obj_bochi_block)){ x += sign(move_x); } 
			else { break; }
		}
		move_x = 0;
	}
} 

//Vertical
else if (move_y != 0){
	var collisionV = instance_place(x, y+move_y, obj_bochi_block);
	if(collisionV != noone and collisionV.collideable){
		repeat(abs(move_y)){
			if(!place_meeting(x, y+sign(move_y), obj_bochi_block)){ y += sign(move_y); } 
			else { break; }
		}
		move_y = 0;
	}
}

//objects
var inst = instance_place(x,y,obj_transition);
if(inst != noone and facing == inst.playerFacingBefore) {
	with(obj_game_manager) {
		if(!doTransition) {
			spawnRoom = inst.targetRoom;
			spawnX = inst.targetX;
			spawnY = inst.targetY;
			spawnPlayerFacing = inst.playerFacingAfter;
			doTransition = true;
		}
	}
}

//textbox
if(_interact_key) {
	
	if(active_textbox == noone) {
		var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, obj_parent_NPC, false ,false);
	
		if(inst != noone) {
			with(inst) {
				var tbox = create_textbox(text, speakers);
				can_move = false;
				move_x = 0;
				move_y = 0;
			}
			active_textbox = tbox;
		}
	} else {
		if(!instance_exists(active_textbox)) {
			active_textbox = noone;
		}
	}
}

x += move_x;
y += move_y;