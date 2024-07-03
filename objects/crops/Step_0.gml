/// @description 
var _show_plant_key = keyboard_check_pressed(ord("S")) || (external_show_plant_press && can_toggle_show_planting);
var _harvest_key = keyboard_check_pressed(ord("H")) || (external_harvest_press && can_toggle_harvesting);
var _planting_key = keyboard_check_pressed(ord("P")) || (external_plant_press && can_toggle_planting);

if ( _show_plant_key) {
    planting = !planting;
    can_toggle_show_planting = false;
    external_show_plant_press = false; // Reset external flag to prevent multiple toggles
} else if (!keyboard_check(ord("S")) && !external_show_plant_press) {
    can_toggle_show_planting = true; // Allow toggling again once the key is released
}

if (_harvest_key) {
    harvesting = !harvesting;
	planting = false;
    can_toggle_harvesting = false;
    external_harvest_press = false; // Reset external flag to prevent multiple toggles
} else if (!keyboard_check(ord("H")) && !external_harvest_press) {
    can_toggle_harvesting = true; // Allow toggling again once the key is released
}

if(room != rm_farm){ planting = false; harvesting = false; exit; }

#region Planting

if(planting){
	mx = obj_farmer.x;
	my = obj_farmer.y;
	
	// Convert farmer's position to grid cell coordinates
    var gridX = floor(mx / cellSize);
    var gridY = floor(my / cellSize);
	
	//if(mouse_wheel_up()) selectCrop += 1; 
	//if(mouse_wheel_down()) selectCrop -= 1; 
	
	if (random(2) == 0) {
	    // Increase selectCrop by a random amount
	    selectCrop += irandom(5); // Adjust the range as per your requirements
	} else {
	    // Decrease selectCrop by a random amount
	    selectCrop -= irandom(5); // Adjust the range as per your requirements
	}
	
	if(selectCrop > sprite_get_number(spr_crops_picked)-1) { selectCrop = 0; }
	else if (selectCrop < 0) { selectCrop = sprite_get_number(spr_crops_picked)-1; }
	
	if(_planting_key){
		var newCrop = instance_create_crop(mx, my, selectCrop);
        if (newCrop != noone) {
            newCrop.cropType = selectCrop; // Assign the crop type to the newly planted crop instance
			audio_play_sound(snd_plant, 1, false);
        }
		can_toggle_planting = false;
	    external_plant_press = false; // Reset external flag to prevent multiple toggles
	} else if (!keyboard_check_pressed(ord("P")) && !external_plant_press) {
	    can_toggle_planting = true; // Allow toggling again once the key is released
	}
}
#endregion

#region Harvesting 

if(harvesting){
    // Harvesting logic
    mx = obj_farmer.x;
    my = obj_farmer.y;
	
    
    if(_harvest_key){
        var nearestCrop = instance_nearest(mx, my, obj_crop);
        if(nearestCrop != noone && nearestCrop.fullyGrown) {
             // Get the position of the nearest crop
            var cropX = nearestCrop.x;
            var cropY = nearestCrop.y;
	        
			var droppedItem = item.none;
			var dropWorm = false;

			switch (nearestCrop.cropType) {
			    case crop.tomato:
			        droppedItem = item.tomato;
			        break;
			    case crop.potato:
			        droppedItem = item.potato;
			        break;
			    case crop.carrot:
			        droppedItem = item.carrot;
			        break;
			    case crop.artichoke:
			        droppedItem = item.artichoke;
			        break;
			    case crop.chilli:
			        droppedItem = item.chilli;
			        break;
			    case crop.gourd:
			        droppedItem = item.gourd;
			        break;
			    case crop.corn:
			        droppedItem = item.corn;
			        break;
			}

			// Check if a worm appears
			var wormChance = irandom_range(1, 10); // Adjust the range as needed
			if (wormChance == 1) {
			    // There's a chance for a worm to appear
			    dropWorm = true;
			}

			// Check if both a crop item and a worm should be dropped
			if (droppedItem != item.none && dropWorm) {
			    // Both a crop item and a worm will be dropped together
			    var instCrop = instance_create_layer(cropX, cropY, "Instances", obj_item);
			    var instWorm = instance_create_layer(cropX, cropY, "Instances", obj_item);

			    with (instCrop) {
			        item_num = droppedItem;
			        x_frame = item_num mod (spr_width / cell_size);
			        y_frame = item_num div (spr_width / cell_size);
			    }

			    with (instWorm) {
			        item_num = item.worm;
			        x_frame = item.worm mod (spr_width / cell_size);
			        y_frame = item.worm div (spr_width / cell_size);
			    }

				// Destroy the nearest crop instance
				instance_destroy(nearestCrop);
				
				var inst_nearest = instance_number(nearestCrop);
				
				if (inst_nearest == 0) {
			        ds_grid_clear(ds_crops_data, -1); // Clear data if no crop instances left
			    }
				
				audio_play_sound(snd_harvest, 1, false);
				
			    // Debug message
			    show_debug_message("Harvested and dropped a crop item and a worm together");
			} else if (droppedItem != item.none) {
			    // Only a crop item will be dropped
			    var inst = instance_create_layer(cropX, cropY, "Instances", obj_item);
			    with (inst) {
			        item_num = droppedItem;
			        x_frame = item_num mod (spr_width / cell_size);
			        y_frame = item_num div (spr_width / cell_size);
			    }
				
				// Destroy the nearest crop instance
				instance_destroy(nearestCrop);
				
				var inst_nearest = instance_number(nearestCrop);
				
				if (inst_nearest == 0) {
			        ds_grid_clear(ds_crops_data, -1); // Clear data if no crop instances left
			    }
				
				 
				audio_play_sound(snd_harvest, 1, false);
				 
			    // Debug message
			    show_debug_message("Harvested and dropped a crop item");
			} else if (dropWorm) {
			    // Only a worm will be dropped
			    var inst = instance_create_layer(cropX, cropY, "Instances", obj_item);
			    with (inst) {
			        item_num = item.worm;
			        x_frame = item.worm mod (spr_width / cell_size);
			        y_frame = item.worm div (spr_width / cell_size);
			    }
				
				// Destroy the nearest crop instance
				instance_destroy(nearestCrop);
				 
				var inst_nearest = instance_number(nearestCrop);
				
				if (inst_nearest == 0) {
			        ds_grid_clear(ds_crops_data, -1); // Clear data if no crop instances left
			    } 
				
				
				audio_play_sound(snd_harvest, 1, false);
				 
			    // Debug message
			    show_debug_message("Harvested and dropped a worm");
			}
					
        }
		can_toggle_harvesting = false;
	    external_harvest_press = false; 
    } else {
		can_toggle_harvesting = true; 
	}
}

#endregion

if(instance_exists(obj_crop) and keyboard_check_pressed(ord("G"))){
	with(obj_crop){
		if(growthStage < maxGrowthStage){
			daysOld += 1;
			
			//First growth
			var firstGrowth = 0;
			if(daysOld > 0){ firstGrowth = 1; }
			
			growthStage = firstGrowth + (daysOld div growthStageDuration);
		} else {
			growthStage = maxGrowthStage;
			fullyGrown = true;
			alarm[1] = 1;
		}
		
	}
}