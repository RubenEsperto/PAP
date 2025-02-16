randomize();
if (gen == true){
	do {
		var ran_room = irandom(3);
		
		var ran_type = irandom(2);
		
		rooms_generated ++; //+1
		
		if (instance_number(obj_room) == 10) {
			gen = false;	
		}
		if (ran_room == 0 && !place_meeting(genx,geny-768, obj_room)){
			up = false;
			down = true;
			left = false;
			right = false;
			
			instance_create_depth(genx+512,geny,-1,obj_door_top);
			geny -= 768;
			instance_create_depth(genx,geny,1,obj_room);
			
			if (ran_type == 0){
				instance_create_depth(genx+512,geny+704,-1,obj_door_bottom);
			}
			else if (ran_type == 1){
				instance_create_depth(genx+512,geny+384,1,obj_mob_room);
				instance_create_depth(genx+512,geny+704,-1,obj_door_bottom);
			}
			else if (ran_type == 2 && powerup_rooms > 0){
				instance_create_depth(genx+512,geny+384,1,obj_powerup_room);
				instance_create_depth(genx+512,geny+704,-1,obj_door_bottom);
				geny += 768;
				powerup_rooms --;
			}
		}
		if (ran_room == 1 && !place_meeting(genx,geny+768, obj_room)) {
			up = true;
			down = false;
			left = false;
			right = false;
			
			instance_create_depth(genx+512,geny+704,-1,obj_door_bottom);
			geny += 768;
			instance_create_depth(genx,geny,1,obj_room);
			
			if (ran_type == 0){
				instance_create_depth(genx+523,geny,-1,obj_door_top);
			}
			else if (ran_type == 1){
				instance_create_depth(genx+512,geny-384,1,obj_mob_room);	
				instance_create_depth(genx+523,geny,-1,obj_door_top);
			}
			else if (ran_type == 2 && powerup_rooms > 0){
				instance_create_depth(genx+512,geny-384,1,obj_powerup_room);
				instance_create_depth(genx+523,geny,-1,obj_door_top);
				geny -= 768;
				powerup_rooms --;
			}
		}
		if (ran_room == 2 && !place_meeting(genx+1024,geny, obj_room)){
			right = false;
			left = true;
			up = false;
			down = false;
			instance_create_depth(genx+960,geny+352,-1,obj_door_right);
			genx += 1024;
			instance_create_depth(genx,geny,1,obj_room);
			
			if (ran_type == 0){
				instance_create_depth(genx,geny+352,-1,obj_door_left)
			}
			else if (ran_type == 1){
				instance_create_depth(genx+512,geny+384,1,obj_mob_room);	
				instance_create_depth(genx,geny+352,-1,obj_door_left)
			}
			else if (ran_type == 2 && powerup_rooms > 0){
				instance_create_depth(genx+512,geny+384,1,obj_powerup_room);
				instance_create_depth(genx,geny+352,-1,obj_door_left)
				genx -= 1024;
				powerup_rooms --;
			}
		}
		if (ran_room == 3 && !place_meeting(genx-1024,geny, obj_room)){
			left = false;
			up = false;
			down = false;
			right = true;
			instance_create_depth(genx,geny+352,-1,obj_door_left);
			genx -= 1024
			instance_create_depth(genx,geny,1,obj_room);
			
			if (ran_type == 0){
				instance_create_depth(genx+960,geny+352,-1,obj_door_right)
			}
			else if (ran_type == 1){
				instance_create_depth(genx+512,geny+384,1,obj_mob_room);
				instance_create_depth(genx+960,geny+352,-1,obj_door_right)
			}
			else if (ran_type == 2 && powerup_rooms > 0){
				instance_create_depth(genx+512,geny+384,1,obj_powerup_room);
				instance_create_depth(genx+960,geny+352,-1,obj_door_right)
				genx += 1024
				powerup_rooms --;
			}
		}
	}
	until (instance_number(obj_room) >= 10)
}