global.gamepad_id = noone;

gamepad_connect = function(){
	var gamepad_device = gamepad_get_device_count();
	
	for(var i = 0; i < gamepad_device; i++){
		if(gamepad_is_connected(i)){
		global.gamepad_id = i;
		return true;
		}
	}
	
	return false;
	
}