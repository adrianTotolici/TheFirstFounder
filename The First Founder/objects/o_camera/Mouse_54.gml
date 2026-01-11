// Destroy any existing menu first
if (instance_exists(o_context_menu)) {
    instance_destroy(o_context_menu);
}

// Create the new menu at mouse position
var _menu = instance_create_layer(mouse_x, mouse_y, "Instances_2", o_context_menu);
_menu.target_x = mouse_x;
_menu.target_y = mouse_y;
_menu.grid_x = mouse_x div 64;
_menu.grid_y = mouse_y div 64;