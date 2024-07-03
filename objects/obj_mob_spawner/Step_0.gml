/// @description Insert description here
// You can write your code in this editor

timer--;

if(timer == 0 and spawn < spawnMax ){

	var random_fish = choose(
	obj_bangus, obj_biya, obj_galungong, obj_kanduli,
	obj_lapu_lapu, obj_malasugi, obj_maya_maya, obj_tamban,
	obj_tilapia, obj_tulingan);
	
	while (place_meeting(xx, yy, obj_block_earth)) { //or use place empty or some other method of collision detection.
	    xx = irandom(10490);
	    yy = irandom_range(1780, 2592);
	}
	
	instance_create_layer(xx, yy, "Instances", random_fish);
	
	xx = irandom(10490);
	yy = irandom_range(1780, 2592);
	 
	timer = time;
	spawn++;

}