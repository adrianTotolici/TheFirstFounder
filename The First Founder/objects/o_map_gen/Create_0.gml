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

for (var i = 0; i < _w; i++){
	for (var j = 0; j < _h; j++){
		var _val = TILE_GRASS;
		
		var _chance = irandom(100);
        
        if (_chance < 5)  
			_val = TILE_GRASS_FLLOWERS
		
		// Save to logic grid
		ds_grid_set(global.map_data, i, j, _val)
		
		tilemap_set(_tilemap_id, _val, i, j);
	}
}