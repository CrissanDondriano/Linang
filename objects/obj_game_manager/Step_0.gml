// If the "EffectLeaf" layer exists,
//if (layer_exists("EffectLeaf"))
//{
	// If the player exists,
//	if (instance_exists(obj_player))
//	{
		// If the player is colliding with a  "stop leaf effect" instance,
//		var _player_colliding = false;
		
//		with (obj_player) {
//			_player_colliding = place_meeting(x, y, obj_stop_leaf_effect);
//		}
		
//		if (_player_colliding)
//		{
			// Set leaf particle count to 0
	//		fx_set_parameter(effect_leaf, "param_num_particles", 0);
		
			// Set in_cave to true for ambient audio
	//		in_cave = true;
		
			// Call User Event 0 which switches ambient audio depending on in_cave
	//		event_user(0);
	//	}
		// Otherwise,
	//	else
	//	{
			// Restore leaf count
			// fx_set_parameter(effect_leaf, "param_num_particles", leaf_count);
		
			// Set in_cave to false for ambient audio
	//		in_cave = false;
		
			// Call User Event 0 which switches ambient audio depending on in_cave
	//		event_user(0);
	//	}
//	}
//s}

// Your optimized Step event code
if (!layerCreated) {
    // Check if the game is not running on a non-browser platform or it's running on specific OS
    if (os_browser != browser_not_a_browser || os_type == os_operagx || os_type == os_android || os_type == os_ios) {
        // Check the room and create the touch controls layer accordingly
        if (room == rm_level_1) {
            layer_sequence_create("TouchControlsLayer", 0, 0, seq_touch_controls);
        } else if (room == rm_farm || room == rm_farm_upstair || room == rm_farm_house || room == rm_forest) {
            layer_sequence_create("TouchControlsLayer", 0, 0, seq_farm_touch_controls);
        }
        // Mark that the layer has been created to prevent repeated creation
        layerCreated = true;
    }
}

