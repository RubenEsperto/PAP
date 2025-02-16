instance_create_depth(0,0, 1, obj_room); //creates first room 0x0

rooms_generated = 0; //How many rooms are generated
genx = 0; //room x coordinate
geny = 0; //room y coordinate
gen = true; //true = enable generation

up = false; //set the direction of the next room
down = false;
left = false;
right = false;

powerup_rooms = 1;