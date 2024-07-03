// Collision Event with obj_wall in obj_player

// Get the relative position of the wall object
var wall_x = other.x;

// Check for collision on the right
if (wall_x > x) {
    // Handle right-side collision
	x += -500;
	enemyspeed *= -1;
    //show_message("Collided on the right side!");
}

// Check for collision on the left
else if (wall_x < x) {
    // Handle left-side collision
	x += 500;
	enemyspeed *= -1;
    //show_message("Collided on the left side!");
}
