// Step Event of obj_fish_parent

if (enemyspeed < 0) {
    // Moving right
    image_xscale = -1; // Original orientation
} else if (enemyspeed > 0) {
    // Moving left
    image_xscale = 1; // Flipped horizontally
}


x += enemyspeed;
