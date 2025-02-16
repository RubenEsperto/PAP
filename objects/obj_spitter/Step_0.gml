if (place_meeting(x,y,obj_tear)){
	var nearest_tear;
	nearest_tear = instance_nearest(x,y,obj_tear);
	
	direction = point_direction(x,y,nearest_tear.x,nearest_tear.y) + 180;
	hp -= global.damage;
	alarm[0] = 5;
	with(nearest_tear){
		instance_destroy();
	}
}

if (hp < 1){
	instance_destroy();	
}