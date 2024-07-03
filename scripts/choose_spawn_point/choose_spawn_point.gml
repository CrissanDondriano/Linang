// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function choose_spawn_point(){
	// Define the boundaries of your water tile within the room
	var water_tile_left = 100; // Example: left edge of the water tile
	var water_tile_right = 500; // Example: right edge of the water tile
	var water_tile_top = 200; // Example: top edge of the water tile
	var water_tile_bottom = 400; // Example: bottom edge of the water tile

	// Generate random coordinates within the boundaries of the water tile
	var spawn_x = irandom_range(water_tile_left, water_tile_right);
	var spawn_y = irandom_range(water_tile_top, water_tile_bottom);

	// Return the randomly chosen spawn point
	return {x: spawn_x, y: spawn_y};
}