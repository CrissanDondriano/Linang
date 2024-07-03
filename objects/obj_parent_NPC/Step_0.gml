
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

x += move_x;
y += move_y;