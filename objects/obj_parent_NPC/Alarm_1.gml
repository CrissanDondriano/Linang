move_x = 0;
move_y = 0;

if(can_move) {
	var _idle = choose(0,1);
	if(_idle == false ) {
		var _dir = choose(1,2,3,4);

		switch(_dir) {
			case 1: move_x = -spd; break;
			case 2: move_x = spd; break;
			case 3: move_y = -spd; break;
			case 4: move_y = spd; break;
		}
	}
}
alarm[1] = random_range(2.5, 4)*room_speed;