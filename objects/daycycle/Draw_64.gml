if(draw_daylight){
	var c = light_colour;
	draw_set_alpha(darkness);
	draw_rectangle_color(0,0, guiWidth, guiHeight, c,c,c,c, false);
	draw_set_alpha(1);
}

draw_set_font(fnt_text_daycycle); 

// Define colors
var white = c_silver;

// Define sprite indices
var sun = spr_sun; // Replace with the index of your sun sprite
var moon = spr_moon; // Replace with the index of your moon sprite

// Round down the hours, minutes, and seconds to remove decimal points
var int_hours = floor(hours);
var int_minutes = floor(minutes) mod 60; // Use modulo 60 to ensure minutes are in the 0-59 range
var int_seconds = floor(seconds) mod 60; // Use modulo 60 to ensure seconds are in the 0-59 range

// Calculate the time of day based on hours
var timeOfDay = (int_hours % 24) / 24; // Value between 0 and 1 representing the time of day

// Define positions for sun and moon
var sunX = 920;
var sunY = 50;
var moonX = 920;
var moonY = 50;

var rotationSpeed = 360; // Degrees per hour, adjust as needed

// Calculate rotation angle based on time of day
var sunRotation = timeOfDay * 360; // 360 degrees for a full day
var moonRotation = (timeOfDay + 0.5) * 360; // Offset moon rotation by half a day

// Draw sun/moon icon based on time of day
if (timeOfDay >= 0.25 && timeOfDay < 0.75) {
    // Daytime
    draw_sprite_ext(spr_sun, 0, sunX, sunY, 1, 1, sunRotation, c_white, 1); // Draw the sun with rotation
    draw_sprite_ext(spr_moon, 0, moonX, moonY, 1, 1, moonRotation, c_white, 0); // Hide the moon
} else {
    // Nighttime
    draw_sprite_ext(spr_sun, 0, sunX, sunY, 1, 1, sunRotation, c_white, 0); // Hide the sun
    draw_sprite_ext(spr_moon, 0, moonX, moonY, 1, 1, moonRotation, c_white, 1); // Draw the moon with rotation
}

// Add bouncing animation to dayString
var yOffset = 2 * sin((current_time / 1000) * 3);

// Format the time string, ensuring two digits for minutes and seconds
var timeString = "TIME: " + string(int_hours) + ":" + string_format(int_minutes, 2, 0) + ":" + string_format(int_seconds, 2, 0);
draw_text_color(10, 10 + yOffset, timeString, white, white, white, white, 1);

// Display the day with an animated effect
var dayString = "DAY: " + string(day);
draw_text_color(10, 40 + yOffset, dayString, white, white, white, white, 1);

// Display season with a bouncing effect
var seasonString = "SEASON: " + string(season);
draw_text_color(10,70, seasonString, white, white, white, white, 1);

// Add bouncing animation to seasonString
yOffset = 2 * sin((current_time / 1000) * 3 + 2);
draw_text_color(10, 70 + yOffset, seasonString, white, white, white, white, 1);

// Display year with a bouncing effect
var yearString = "YEAR: " + string(year);
draw_text_color(10,100, yearString, white, white, white, white, 1);

// Add bouncing animation to yearString
yOffset = 2 * sin((current_time / 1000) * 3 + 4);
draw_text_color(10, 100 + yOffset, yearString, white, white, white, white, 1);



