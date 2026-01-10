var _w = room_width  / 64;
var _h = room_height / 64;

// Create the grid to store logic
global.map_data = ds_grid_create(_w, _h);

//Define Tile Types
#macro TILE_EMPTY 0
#macro TILE_GRASS 1
#macro TILE_GRASS_FLLOWERS 2

// Fill the grid and Draw Tiles
var _layer_id = layer_create(100, "MapLayer");
var _tilemap_id = layer_tilemap_create(_layer_id, 0 , 0, ts_terrain, _w, _h);

// Fill everythiong with default value
ds_grid_set_region(global.map_data, 0, 0, _w, _h, TILE_GRASS);

// Create Patches
// Patches number 
var patch_nr = 30;
repeat(patch_nr) { 
	var _seed_x  = irandom(_w - 1);
	var _seed_y = irandom(_h - 1);
	var _patch_size =  irandom_range(3, 8);
	
	for (var i = 0; i < _patch_size; i++) {
		var _target_x = _seed_x + irandom_range(-1, 1);
		var _target_y = _seed_y + irandom_range(-1, 1);
		
		//Ensure we are inside the grid
		if (_target_x >=0 && _target_x < _w && _target_y >= 0 && _target_y < _h) {
			ds_grid_set(global.map_data, _target_x, _target_y, TILE_GRASS_FLLOWERS);
		}
	}
}

// Draw the grid to tilemap
for (var i = 0; i < _w; i++){
	for  (var j = 0; j <  _h; j++){
		tilemap_set(_tilemap_id, ds_grid_get(global.map_data, i, j), i, j);
	}
}
