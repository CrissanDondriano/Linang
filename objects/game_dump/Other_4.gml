// FARM ENVIRONMENT
if (spawnRoom == -1) {
	exit;
} else {
	obj_farmer.x = spawnX;
	obj_farmer.y = spawnY;
	obj_farmer.facing = spawnPlayerFacing;
	
	with(obj_farmer) {
		switch(facing) {
			case dir.left:  y_frame = 9; break;
			case dir.right: y_frame = 11; break;
			case dir.up:	y_frame = 8; break;
			case dir.down:  y_frame = 10; break;
			case -1:		x_frame = 0; break;
		}
	}
}