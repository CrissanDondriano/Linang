// Set the X velocity to move_speed.
// This makes the character move right.
if(obj_player.is_stuck && obj_player.sprite_index == spr_player_row) {
	vel_x = move_speed;
	image_xscale = 1;
} 



// This checks if the current sprite is the fall sprite, meaning the player hasn't landed yet.
if (sprite_index == spr_player_fall)
{
	// In that case we exit/stop the event here, so the sprite doesn't change.
	exit;
}

// This checks if the player is on the ground, before changing the sprite to the walking sprite. This is
// done to ensure that the walking sprite does not active while the player is in mid-air.
if (grounded)
{
	// Change the instance's sprite to the walking player sprite.
	sprite_index = spr_player_walk;
}