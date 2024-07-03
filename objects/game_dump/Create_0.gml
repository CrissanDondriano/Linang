if(room == rm_farm0) {
	randomize();
	room_goto_next();
	
	global.game_width = 1920;
	global.game_height = 1080;

	display_set_gui_size(global.game_width, global.game_height);
} 

spawnRoom = -1;
spawnPlayerFacing = -1;
spawnX = 0;
spawnY = 0;

