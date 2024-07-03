// This creates the HUD sequence, which shows all HUD elements (such as coins and hearts). It lasts throughout the level.
if (room == rm_level_1) {
    // Show the layer sequence "Instances"
    layer_sequence_create("Instances", 0, 0, seq_game_hud);
}


if(room == rm_farm0) {
	randomize();
	room_goto_next();
	
	global.game_width = 1920;
	global.game_height = 1080;

	display_set_gui_size(global.game_width, global.game_height);
} 


debug = false;
blackAlpha = 0;
spawnRoom = -1;
doTransition = false;
spawnPlayerFacing = -1;
spawnX = 0;
spawnY = 0;

enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}


// paused: This will be true when the game is paused, and false when it's not
paused = false;
// pause_sequence: The ID of the Sequence element created for the pause menu, used to close it
// when the player hits Escape to resume
pause_sequence = -1;
collectors_sequence = layer_get_id("Collectors");
// in_cave: Tells whether the player is in a cave (true) or not (false), used for ambient audio
in_cave = false;
layerCreated = false;

// If the "EffectLeaf" layer exists,
//if (layer_exists("EffectLeaf")) {
    // Get the leaf effect FX struct
//    effect_leaf = layer_get_fx("EffectLeaf");

    // Get the number of leaves
 //   leaf_count = fx_get_parameter(effect_leaf, "param_num_particles");
//}