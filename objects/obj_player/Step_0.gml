if (keyboard_check(ord("W")) && keyboard_check(ord("A"))) {move_speed = 4;}
else if (keyboard_check(ord("W")) && keyboard_check(ord("D"))) {move_speed = 4;}
else if (keyboard_check(ord("S")) && keyboard_check(ord("A"))) {move_speed = 4;}
else if (keyboard_check(ord("S")) && keyboard_check(ord("D"))) {move_speed = 4;}
else {move_speed = 5;}

if (can_move == true){
	if (keyboard_check(ord("W")) && !place_meeting(x,y-move_speed,obj_room)) {
		y -= move_speed;
		move_dir = 90;
	}
	if (keyboard_check(ord("S")) && !place_meeting(x,y+move_speed,obj_room)) {
		y += move_speed;
		move_dir = 270;
		}
	if (keyboard_check(ord("A")) && !place_meeting(x-move_speed,y,obj_room)) {
		x -= move_speed;
		move_dir = 180;
	}
	if (keyboard_check(ord("D")) && !place_meeting(x+move_speed,y,obj_room)) {
		x += move_speed;
		move_dir = 0;
	}
}

if (keyboard_check(ord("W")) || keyboard_check(ord("S")) || keyboard_check(ord("A")) || keyboard_check(ord("D"))){
	moving = true;
} else {moving = false;}

if (keyboard_check(ord("Q"))) { //debug key
	game_restart();
}

if (keyboard_check(vk_up)) {
	if (firing == false) {
		global.dir = 90;
		tear_shoot();
		firing = true;
		alarm[0] = 50;
	}
}

if (keyboard_check(vk_down)) {
	if (firing == false) {
		global.dir = 270;
		tear_shoot();
		firing = true;
		alarm[0] = 50;
	}
}

if (keyboard_check(vk_left)) {
	if (firing == false) {
		global.dir = 180;
		tear_shoot();
		firing = true;
		alarm[0] = 50;
	}
}

if (keyboard_check(vk_right)) {
	if (firing == false) {
		global.dir = 0;
		tear_shoot();
		firing = true;
		alarm[0] = 50;
	}
}

if (distance_to_object(obj_walker) < 10) {
	var nearest_enemy;	
	nearest_enemy = instance_nearest(x,y,obj_walker);
	
	direction = point_direction(x,y,nearest_enemy.x,nearest_enemy.y) + 180;
	
	bounce = 1;
	hp -= 1; //take away hp
	
	alarm[1] = 30;
	
	with (nearest_enemy) { //prevents stunlock against the wall
		direction = point_direction(x,y,obj_player.x,obj_player.y) + 180;
		bounce = 1;
		alarm[0] = 10;
	}
}
else if (place_meeting(x,y,obj_spit)) {
	var nearest_spit;	
	nearest_spit = instance_nearest(x,y,obj_spit);
	
	direction = point_direction(x,y,nearest_spit.x,nearest_spit.y) + 180;
	
	bounce = 1;
	hp -= 1;
	
	with(nearest_spit){
		instance_destroy();	
	}
	alarm[1] = 10;
}

if (bounce == 1){
		can_move = false;
		speed = 5;
		bounce = 0;
}

if (place_meeting(x,y,obj_spitter)){
	x = anti_stick_x
	y = anti_stick_y
}
else if (place_meeting(x,y,obj_room)){	
	x = anti_stick_x
	y = anti_stick_y	
}
else {
	anti_stick_x = x;
	anti_stick_y = y;
}

if (place_meeting(x,y,obj_powerup_1)){
	power_up = 1;
	with (obj_powerup_1) {
		instance_destroy();	
	}
}

if (place_meeting(x,y,obj_powerup_2)){
	power_up = 2;	
	global.damage = 3; //sets global damage
	with (obj_powerup_2) {
		instance_destroy();	
	}
}

if (place_meeting(x,y,obj_powerup_3)){
	power_up = 3;
	global.damage = 0.5 // **
	with (obj_powerup_3) {
		instance_destroy();	
	}
}

function tear_shoot(){
	switch(power_up){
		case 0: 			
			instance_create_depth(x,y,1,obj_tear);
		break;
		
		case 1:
			if (global.dir == 90 || global.dir == 270){
				instance_create_depth(x-30,y,1,obj_tear);
				instance_create_depth(x,y,1,obj_tear);
				instance_create_depth(x+30,y,1,obj_tear);
			}
			else if (global.dir == 0 || global.dir == 180){
				instance_create_depth(x,y-30,1,obj_tear);
				instance_create_depth(x,y,1,obj_tear);
				instance_create_depth(x,y+30,1,obj_tear);
			}
		break;
		
		case 2:
			instance_create_depth(x,y,1,obj_tear);
			with(obj_tear){
				image_xscale = 2;
				image_yscale = 2;
			}
		break;
		
		case 3:
			instance_create_depth(x,y,1,obj_tear);
			with(obj_tear){
				lock_on = true;	
			}
		break;
	}
	
}

if (hp < 1 ){
	instance_destroy();	
}

if (moving = true) {
	image_speed = 0.1;
	if move_dir = 270 {sprite_index = spr_player_walk_down}	
	if move_dir = 0 {sprite_index = spr_player_walk_right}
	if move_dir = 90 {sprite_index = spr_player_walk_up}
	if move_dir = 180 {sprite_index = spr_player_walk_left}
} else {
	sprite_index = spr_player_idle_down;
	image_speed = 0.05;
}

