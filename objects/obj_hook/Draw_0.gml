// Example Draw event code
// Get player position
var player_x = obj_player.x + 139;
var player_y = obj_player.y + 49;

// Get hook position (this object's position)
draw_set_color(c_white); // Set the line color to black

var _line_width = 5;

draw_line_width(player_x, player_y, x, y, _line_width);

draw_set_color(c_white);

draw_self();
