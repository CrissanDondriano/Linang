image_speed = 1; // Adjust as needed
if (image_index >= sprite_get_number(sprite_index) - 1) {
	image_speed = 0; // Stop the animation after the last frame
	animation_trigger = false; // Reset the trigger if you want to stop after one loop
	layer_sequence_create("Collectors", 0, 0, seq_game_collector_blank);
} 
