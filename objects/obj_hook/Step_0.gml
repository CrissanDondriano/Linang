

if ((keyboard_check_pressed(ord("W")) || external_hook_cancel_press) && can_toggle_hook_cancel) { 
     // Calculate direction towards the player
    var dir = point_direction(x, y, obj_player.x, obj_player.y);
    
    // Set speed for the hook movement
    var spd = 5; // Speed of the hook
    
    // Move the hook towards the player
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
    
	if (point_distance(x, y, obj_player.x, obj_player.y) > 10) {
		 instance_destroy();
		 obj_player.sprite_index = spr_player_row;
	}
	 can_toggle_hook_cancel = false;
} else {
	can_toggle_hook_cancel = true;
}


// Hook moving down logic
if (isFishing && !returning) {
    // Move the hook down towards the targetY
    if (y < targetY) {
        y += 5; // Speed of the hook going down
    } else {
        // Hook has reached the target depth, now check for fish catching
        var fish = instance_place(x, y, obj_enemy_parent_right);
        if (fish != noone) {
            // A fish has been caught
            caughtFish = fish;
            fish.caught = true; // Custom variable in obj_fish to indicate it's been caught
			var specificFishName = fish.fishName;
			show_debug_message("Caught a " + specificFishName);
			 // Add fighting simulation for the fish
            fish.fighting = true; // Set the fish to be in fighting mode
            fish.targetX = random_range(-10, 10); // Randomize target X position for fish movement
            fish.targetY =  random_range(-10, 10) // Randomize target Y position for fish movement
            fish.fightTimer = 0;
			
			// Make the caught fish follow the hook
			if (caughtFish != noone) {
				fishFollowHook(caughtFish, x, y, 30, 57, -90);
			}
        }
    }
}

// Additional step to handle fish fighting
if (caughtFish != noone && caughtFish.fighting) {
    // Simulate fish movement as if it's fighting
    speed = 2; // Adjust speed as needed
	caughtFish.targetX = caughtFish.x + random_range(-50, 50);
	caughtFish.targetY = caughtFish.y + random_range(-50, 50);

	// Calculate the direction to move in
	var dirX = sign(caughtFish.targetX - caughtFish.x);
	var dirY = sign(caughtFish.targetY - caughtFish.y);

	// Move the fish towards the target position, ensuring it doesn't exceed the range
	caughtFish.x += clamp(dirX * speed, -10, 10);
	caughtFish.y += clamp(dirY * speed, -10, 10);
    
    // Check if fish has reached its target
    if (abs(caughtFish.x - caughtFish.targetX) < speed && abs(caughtFish.y - caughtFish.targetY) < speed) {
        caughtFish.fighting = false; // Fish stops fighting once it reaches the target

        var chanceOfEscape = 0.5; // Set a chance of escape (e.g., 30%)
        if (random(1) < chanceOfEscape) {
            // Fish escapes
			caughtFish.caught = false;
			
			if (!caughtFish.caught) {
				var xx = x;
		        var yy = y;
		
		        var normalX = x;
				var normalY = y;
				var directionToFace = point_direction(xx, yy, normalX, normalY);
			    // The fish is no longer caught, so it should return to normal behavior
				caughtFish.image_angle = directionToFace;
				caughtFish.image_speed = -1;
			    caughtFish.image_xscale = random_range(1, -1); // Reset to original orientation if needed
			    caughtFish.enemyspeed = 3; // Set the fish's speed to its normal value
			}

            returning = true; // Start returning the hook
            // Add any additional logic for fish escaping (e.g., decreasing player's catch count)
        } else {
            isFishing = false; // Stop the fishing process
            returning = true; // Start returning the hook
        }
    }
}


// Hook returning logic
if (returning) {
    // Move the hook back towards the player
    var dir = point_direction(x, y, obj_player.x, obj_player.y);
    var spd = 5; // Speed of the hook returning
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);

	fishFollowHook(caughtFish, x, y, 30, 57, -90);

    // Check if the hook has returned to the player
    if (point_distance(x, y, obj_player.x, obj_player.y) < 10) {
        // Destroy the fish if it's caught
        if (caughtFish != noone) {
            caughtFish.caught = false;

			switch (caughtFish.fishName) {
			    case "maya-maya":
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_maya_maya);
			        break;
				case "bangus":
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_bangus);
			        break;
				case "biya":
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_biya);
			        break;
				case "galungong":
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_galungong);
			        break;
			    case "kanduli":
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_kanduli);
			        break;
				case "lapu-lapu":
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_lapu_lapu);
			        break;
				case "malasugi":
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_malasugi);
			        break;
				case "tamban":
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_tamban);
			        break;
				case "tilapia":
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_tilapia);
			        break;
				case "tulingan":
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_tilapia);
			        break;
			    default:
			        infoMessage = instance_create_layer(650, 180, "Instances", obj_hud_blank);
			        break;
			}
			          
			instance_destroy(caughtFish);
			
			// Call the function
			call_later(5, time_source_units_seconds, function() {
			    instance_destroy(infoMessage);
				if (obj_boat.image_xscale == 1) {
			        obj_player.sprite_index = spr_player_row;
					obj_player.image_xscale = 1;
				    } else {
					obj_player.sprite_index = spr_player_row;
					obj_player.image_xscale = -1;
				}
			});

        }
	
		// Destroy the hook instance
        instance_destroy(); 
        
    }

}