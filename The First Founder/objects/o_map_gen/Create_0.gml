var _w = room_width  / 64;
var _h = room_height / 64;

// Create the grid to store logic
global.map_data = ds_grid_create(_w, _h);

//Define Tile Types
#macro TILE_EMPTY 0
#macro TILE_GRASS 1
#macro TILE_GRASS_FLOWERS 2
#macro TILE_BERRY_BUSH 3
#macro TILE_LEAVY_GRASS 4

//Init the grid with STRUCTS
for (var i = 0; i < _w; i++) {
	for (var j = 0; j < _h; j++){
		// Every tile start clean grass
		ds_grid_set(global.map_data, i, j, new TileData(TILE_GRASS));
	}
}

// Fill the grid and Draw Tiles
var _layer_id = layer_create(100, "MapLayer");
var _tilemap_id = layer_tilemap_create(_layer_id, 0 , 0, ts_terrain, _w, _h);

/// Generate Flowers
generate_resource_patches(10, TILE_GRASS_FLOWERS, "", 0, 0, true);

// Generate Berry Bushes (Berries resource)
generate_resource_patches(5, TILE_BERRY_BUSH, global.RES_BERRIES, 1, 3, true);

// Generate Leafy grasss (leaves resources)
generate_resource_patches(4, TILE_LEAVY_GRASS, global.RES_LEAVES, 2, 5, true);

// Draw the grid to tilemap
for (var i = 0; i < _w; i++){
	for  (var j = 0; j <  _h; j++){
		var _cell = ds_grid_get(global.map_data, i, j);
		
		if (is_struct(_cell)){
			tilemap_set(_tilemap_id, _cell.visual_id, i, j);
		} else {
			tilemap_set(_tilemap_id, TILE_GRASS, i, j);
		}
	}
}

//Add village
var _start_x = room_width / 2;
var _start_y = room_height / 2;
repeat(3) {
	instance_create_layer(_start_x + irandom_range(-100, 100), _start_y + irandom_range(-100,100), "Instances_2", o_human);
}
