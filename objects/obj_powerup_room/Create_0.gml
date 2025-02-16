randomize();
ran_powerup = irandom(2);
var ran_x = random_range(x-384,x+320);
var ran_y = random_range(y-256,y+192);
if (ran_powerup == 0) {
	instance_create_depth(ran_x,ran_y,1,obj_powerup_1);
}
if (ran_powerup == 1) {
	instance_create_depth(ran_x,ran_y,1,obj_powerup_2);
}
if (ran_powerup == 2) {
	instance_create_depth(ran_x,ran_y,1,obj_powerup_3);
}




