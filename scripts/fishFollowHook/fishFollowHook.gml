/// Function to make the caught fish follow the hook
/// @description Sets the position, angle, and animation of the caught fish to follow the hook.
/// @param {instance} caughtFish - The instance of the caught fish.
/// @param {real} hookX - The x-coordinate of the hook.
/// @param {real} hookY - The y-coordinate of the hook.
/// @param {real} offsetX - The offset in the x-coordinate for the fish.
/// @param {real} offsetY - The offset in the y-coordinate for the fish.
/// @param {real} targetOffsetY - The adjusted Y position for the fish.
/// @returns {void}
function fishFollowHook(caughtFish, hookX, hookY, offsetX, offsetY, targetOffsetY) {
    caughtFish.x = hookX + offsetX;
    caughtFish.y = hookY + offsetY;
    
    var targetXX = hookX;
    var targetYY = hookY + targetOffsetY; // Adjusted Y position
    var directionToFace = point_direction(caughtFish.x, caughtFish.y, targetXX, targetYY);

    // Apply the calculated direction to the fish
    caughtFish.image_angle = directionToFace;
    caughtFish.enemyspeed = 0;
    // Stop the animation at the last frame
    caughtFish.image_speed = 0; 
    caughtFish.image_index = sprite_get_number(caughtFish.sprite_index) - 1; // Set to the last frame of the current sprite
            
    // Debug statement to check if this block is executed
    // show_debug_message("Fish is following the hook.");
}
