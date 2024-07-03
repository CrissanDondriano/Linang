/// @description 
ds_crops_types = -1;
ds_crops_instances = -1;
ds_crops_data = ds_grid_create(4,1);
ds_grid_clear(ds_crops_data, -1);

enum crop {
	tomato,
	potato,
	carrot,
	artichoke,
	chilli,
	gourd,
	corn
}

create_crop_type(4, 40, "tomato");	//tomato
create_crop_type(3, 35, "potato");	//potato
create_crop_type(2, 25, "carrot");	//carrot
create_crop_type(4, 45, "artichoke");	//artichoke
create_crop_type(3, 30, "chilli");	//chilli
create_crop_type(2, 20, "gourd");	//gourd
create_crop_type(5, 50, "corn");	//corn

external_show_plant_press = false;
can_toggle_show_planting = true;
planting = false;
harvesting = false;
selectedCropEnum = -1;
selectCrop = 0;

external_harvest_press = false;
can_toggle_harvesting = false;

external_plant_press = false;
can_toggle_planting = true;

mx = 0;
my = 0; 

cellSize = 32;