event_inherited();

// This block applies to obj_player.
// It runs the Key Down - Right event in it, causing the
// player to move right.
if(obj_player.is_stuck && obj_player.sprite_index == spr_player_row) {
	with (obj_boat) {
	    event_perform(ev_keyboard, vk_right);
	}

	with (obj_player) {
	    external_row_right_press = true;
	}
} else {
	with (obj_player)
	{
		event_perform(ev_keyboard, vk_right);
	}
}