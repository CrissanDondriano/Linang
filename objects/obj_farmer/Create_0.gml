//variables
event_inherited();
n_spd = 3;
w_spd = 1;
r_spd = 4;

spd = n_spd;

move_x = 0;
move_y = 0;

x_frame = 1;
y_frame = 8;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_base = spr_base_male_3;
spr_feet = spr_feet_male_boots_black;
spr_torso = spr_torso_male_messy_raven;
spr_hair = spr_hair_male_messy_raven;
spr_legs = spr_legs_male_pants_green;
spr_shadow = spr_character_shadow;

facing = 0;

portrait_index = 2;
voice = snd_voice2;
name = "Player";

radius = 16;
active_textbox = noone;

external_left_press = false;
external_right_press = false;
external_up_press = false;
external_down_press = false;