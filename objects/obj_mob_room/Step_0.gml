if (spawned == false){
	if (distance_to_object(obj_player) < 400) {//if player has entered the room
		var ran_monster = irandom(1);
		var ran_x = random_range(x-384, x+320);
		var ran_y = random_range(y-256, y+192);
		if (amount >= ran_amount) {
			spawned = true;
		}
		if (ran_monster == 0 && place_empty(ran_x, ran_y)) {
			instance_create_depth(ran_x,ran_y,1,obj_walker);
			amount++;
		}
		if (ran_monster == 1 && place_empty(ran_x,ran_y)) {
			instance_create_depth(ran_x,ran_y,1,obj_spitter);
			amount++;
		}
	}
}

var nearest_enemy;
nearest_enemy = instance_nearest(x,y,par_enemy);

if (distance_to_object(nearest_enemy) < 5000) { //if an enemy exists, lock the doors
	doors_locked = true;
	with(obj_door_top) {
		image_index = 1;	
	}
	with(obj_door_bottom) {
		image_index = 1;	
	}
	with(obj_door_left) {
		image_index = 1;	
	}
	with(obj_door_right) {
		image_index = 1;	
	}
}
else {
	doors_locked = false;
	with(obj_door_top) {
		image_index = 0;	
	}
	with(obj_door_bottom) {
		image_index = 0;	
	}
	with(obj_door_left) {
		image_index = 0;	
	}
	with(obj_door_right) {
		image_index = 0;	
	}
}