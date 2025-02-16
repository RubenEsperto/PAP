if (image_index = 0 && place_meeting(x,y,obj_player)){ //image 0 = door unlocked
		var vx = camera_get_view_x(view_camera[0])
		var vy = camera_get_view_y(view_camera[0])
		camera_set_view_pos(view_camera[0],vx+1024,vy);
		with(obj_player) {
			x += 200;	
		}
}



