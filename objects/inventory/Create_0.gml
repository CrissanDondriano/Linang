depth = -1;
scale = 3;
show_inventory = false;
external_inventory_press = false;
can_toggle_inventory = true;
inv_slots = 24;
inv_slots_width = 8;
inv_slots_height = 3;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;
x_buffer = 2;
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

cell_size = 32;

inv_UI_width = 288;
inv_UI_height = 192;

spr_inv_UI = spr_inventory_UI;
spr_inv_items = spr_inventory_items;

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale);
inv_UI_y = (gui_height * 0.5) - (inv_UI_height * 0.5 * scale);

info_x = inv_UI_x + (9 * scale);
info_y = inv_UI_y + (9 * scale);

slots_x = info_x;
slots_y = inv_UI_y + (40 * scale);

desc_x = info_x;
desc_y = inv_UI_y + (156 * scale);

//---------Player Info
//0 = GOLD
//1 = SILVER
//2 = BRONZE
//3 = NAME

ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Copper";
ds_player_info[# 0, 3] = "Name";

ds_player_info[# 1, 0] = irandom_range(0,99);
ds_player_info[# 1, 1] = irandom_range(0,99);
ds_player_info[# 1, 2] = irandom_range(0,99);
ds_player_info[# 1, 3] = "Player";

//---------Inventory
//0 = ITEM
//1 = NUMBER

ds_inventory = ds_grid_create(2, inv_slots);

//---------Items
enum item {
	none		= 0,
	tomato		= 1,
	potato		= 2,
	carrot		= 3,
	artichoke	= 4,
	chilli		= 5,
	gourd		= 6,
	corn		= 7,
	wood		= 8,
	stone		= 9,
	bucket		= 10,
	chair		= 11,
	picture		= 12,
	axe			= 13,
	potion		= 14,
	starfish	= 15,
	mushroom	= 16,
	worm		= 17,
	height		= 18,
}

#region Create Items for Grid
ds_item_info = ds_grid_create(2, item.height);

var z = 0, i = 0;
ds_item_info[# z, i++] = "Nothing";
ds_item_info[# z, i++] = "Tomato";
ds_item_info[# z, i++] = "Potato";
ds_item_info[# z, i++] = "Carrot";
ds_item_info[# z, i++] = "Artichoke";
ds_item_info[# z, i++] = "Chilli";
ds_item_info[# z, i++] = "Gourd";
ds_item_info[# z, i++] = "Corn";
ds_item_info[# z, i++] = "Wood";
ds_item_info[# z, i++] = "Stone";
ds_item_info[# z, i++] = "Bucket";
ds_item_info[# z, i++] = "Chair";
ds_item_info[# z, i++] = "Picture";
ds_item_info[# z, i++] = "Axe";
ds_item_info[# z, i++] = "Potion";
ds_item_info[# z, i++] = "Starfish";
ds_item_info[# z, i++] = "Mushroom";
ds_item_info[# z, i++] = "Worm";

var z = 1, i = 0;
ds_item_info[# z, i++] = "Empty";
ds_item_info[# z, i++] = "It's a yummy red fruit that's round and full of stuff like Calcium and Vitamin K to make your bones super strong!";
ds_item_info[# z, i++] = "Potatoes are awesome! They're brown and round veggies hiding underground. They're packed with vitamins to help you grow strong and stay healthy!";
ds_item_info[# z, i++] = "Carrots are like magic wands of the garden! They're long, skinny, and orange, and they grow in the dirt. Eating them helps you see better in the dark because they're full of vitamin A!";
ds_item_info[# z, i++] = "Imagine a plant that's like a cool puzzle before it blooms into a flower – that's an artichoke! And guess what? It's got fiber to make your tummy happy!";
ds_item_info[# z, i++] = "A chili is a tiny, spicy veggie that comes in all sorts of colors. It's like a little firework in your mouth! Eating chilies can make your heart dance with joy!";
ds_item_info[# z, i++] = "A gourd is a cool fruit with a hard shell, and it can be all sorts of shapes and colors, kind of like a squash!";
ds_item_info[# z, i++] = "It's a super popular grain that people all over the world love to eat!";
ds_item_info[# z, i++] = "Humans use them to build cool stuff like houses, furniture, and more!";
ds_item_info[# z, i++] = "They're best buddies with wood when it comes to building houses and furniture!";
ds_item_info[# z, i++] = "It's like a special container for holding liquids, often found in bathrooms to keep water handy!";
ds_item_info[# z, i++] = "Chairs are awesome because they're made for sitting! You can find them everywhere you go!";
ds_item_info[# z, i++] = "Pictures are like magic windows that show our favorite memories and amazing talents through art!";
ds_item_info[# z, i++] = "An axe is like a superhero tool for chopping wood into pieces to make lots of cool stuff!";
ds_item_info[# z, i++] = "In fantasy stories, potions are like special drinks with magical powers that can heal people!";
ds_item_info[# z, i++] = "Even though it's called a 'starfish,' it's not actually a fish! And guess what? Its mouth is right in the middle!";
ds_item_info[# z, i++] = "It's a special kind of fungus that loves to grow in damp places or on plants";
ds_item_info[# z, i++] = "Worms are great for fishing! You can find them when you're picking veggies in fields. I bet they'll make perfect bait!";
#endregion



