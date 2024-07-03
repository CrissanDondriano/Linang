event_inherited();
//variables
n_spd = 2;
w_spd = 1;
r_spd = 3;

spd = w_spd;

move_x = 0;
move_y = 0;

x_frame = 1;
y_frame = 8;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_base = -1;
spr_feet = -1;
spr_torso = -1;
spr_hair = -1;
spr_legs = -1;
spr_shadow = spr_character_shadow;

alarm[1] = 1;

can_move = true;

portrait_index = 0;
voice = snd_voice2;
name = "Anonymous";
text = ["Hello."];
speakers = [id];