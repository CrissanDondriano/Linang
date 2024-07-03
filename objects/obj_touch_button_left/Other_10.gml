event_inherited();

// This block applies to obj_player.
// It runs the Key Down - Left event in it, causing the
// player to move left.
if(obj_player.is_stuck && obj_player.sprite_index == spr_player_row) {
	with (obj_boat)
	{
		event_perform(ev_keyboard, vk_left);
	}

	with (obj_player) {
	    external_row_left_press = true;
	}
} else {
	with (obj_player)
	{
		event_perform(ev_keyboard, vk_left);
	}
}