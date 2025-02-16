if (lock_on == true && instance_exists(par_enemy)){
	var nearest_enemy;
	nearest_enemy = instance_nearest (x,y,par_enemy);
	move_towards_point(nearest_enemy.x, nearest_enemy.y, 10);
}

if (place_meeting(x,y,obj_room)){
	instance_destroy();	
}


