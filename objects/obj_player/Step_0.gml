event_inherited();

// Set the position of the default audio listener to the player's position, for positional audio
// with audio emitters (such as in obj_end_gate)
audio_listener_set_position(0, x, y, 0);

var hook_id = noone;

// Variable to control if the player can move left or right
if (is_stuck) {

    switch(obj_player.sprite_index) {
		
        case spr_player_row:
		
            if (obj_boat.image_xscale == 1 || external_row_right_press) {
                x = obj_boat.x + 100;
                y = obj_boat.y + 50;
				image_xscale = 1;
            } 
			
			if (obj_boat.image_xscale == -1 || external_row_left_press) {
                x = obj_boat.x - 100;
                y = obj_boat.y + 50;
				image_xscale = -1;
            } 
			
			if(sprite_index == spr_player_row){
				if((keyboard_check_pressed(ord("F")) || external_fish_press) && can_toggle_fish) {
					sprite_index = spr_player_fish;
					obj_boat.visible = true;
					hook_id = instance_create_layer(x + 300, y, "Instances", obj_hook);
					hook_id.isFishing = true;
					hook_id.targetY = y + random_range(400, 700);
					hook_id.returning = false;
					can_toggle_fish = false;
				} else {
					can_toggle_fish = true;
				}
				external_fish_press = false;
			}
		
			break;
			
        case spr_player_fish:
		
			if (image_xscale == 1) {
	            x = obj_boat.x + 300;
	            y = obj_boat.y + 15;
	        } 
			if (obj_boat.image_xscale == -1){
				x = obj_boat.x - 100;
	            y = obj_boat.y;
				image_xscale = 1;
			}

            break;
        default:
            // Handle default case
            break;
    }
}

// Begin Step Event
// Apply gravity initially


// Check if the object is not colliding with obj_bridge
if (!place_meeting(x, y, obj_bridge)) {
    vel_y = 0; // Reset vertical velocity to 0
}
