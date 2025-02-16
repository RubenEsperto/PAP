if (instance_exists(obj_player)) {
	if (can_attack == true && distance_to_object(obj_player) <= 500 || can_attack == true && distance_to_object(obj_tear) <= 200){
		mp_potential_step(obj_player.x,obj_player.y,3,true);
	}
}

if (place_meeting (x,y,par_enemy)) { // prevents walkers from getting stuck in each other
	if (place_empty(x+50,y)){
		x += 3;	
	} else if (place_empty(x,y+50)){
		y += 3;	
	} else if (place_empty(x,y-50)){
		y -= 3;	
	} else if (place_empty(x-50,y)){
		x -= 3;	
	}
}

if (place_meeting(x,y,obj_tear)){
	var nearest_tear;
	nearest_tear = instance_nearest(x,y,obj_tear);
	
	direction = point_direction(x,y,nearest_tear.x,nearest_tear.y) + 180;
	bounce = 1;
	hp -= global.damage;
	alarm[0] = 5;
	with(nearest_tear){
		instance_destroy();
	}
}

if (bounce == 1){
	speed = 5;
	bounce = 0;
	can_attack = false;
}

if (place_meeting(x,y,obj_spit)){
	var nearest_spit;
	nearest_spit = instance_nearest(x,y,obj_spit);
	
	with(nearest_spit){
		instance_destroy();		
	}
}

if (place_meeting(x,y,obj_room)){
	x = anti_stick_x;
	y = anti_stick_y
}
else {
	anti_stick_x = x;
	anti_stick_y = y;
}

if (hp < 1){
	instance_destroy();	
}