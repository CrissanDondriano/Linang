// If the player instance does not exist,
if (!instance_exists(obj_player))
{
	// Exit the event so it does not run
	exit;
}

// Draw the coin HUD object itself
draw_self();

// This font will now be used for drawing text
draw_set_font(ft_hud);

