if(room == rm_level_1) {
	// Restore ambient audio volumes
	//audio_sound_gain(snd_amb_cave_01, vol_cave_1, 0);

	//audio_sound_gain(snd_amb_cave_02, vol_cave_2, 0);

	audio_sound_gain(snd_bg_fishing, vol_bg_fishing, 0);
	
	//audio_sound_gain(snd_amb_trees, vol_trees, 0);

	audio_sound_gain(snd_amb_wind, vol_wind, 0);

	// Stop music and ambient audio
	//audio_stop_sound(snd_music_level);

	//audio_stop_sound(snd_amb_cave_01);

	//audio_stop_sound(snd_amb_cave_02);

	audio_stop_sound(snd_bg_fishing);
	
	//audio_stop_sound(snd_amb_trees);

	audio_stop_sound(snd_amb_wind);

	// Restore the leaf count for the leaves effect
	//fx_set_parameter(effect_leaf, "param_num_particles", leaf_count);
}

if(room == rm_farm || room == rm_farm_house || room == rm_farm_upstair || room == rm_forest) {
	audio_sound_gain(snd_bg_farm, vol_bg_farm, 0);
	audio_stop_sound(snd_bg_farm);
	
}
layerCreated = false;