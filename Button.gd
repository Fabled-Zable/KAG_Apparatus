extends Button


func _ready():
	pass 


func _on_Button_button_up():
	var kagPath : String = "C:/Program Files (x86)/Steam/steamapps/common/King Arthur's Gold";
	var LaunchOptionButton : OptionButton = $"../OptionButton"
	
	var output : Array = [""];
	var pid : int;
	match LaunchOptionButton.get_item_text(LaunchOptionButton.get_selected_id()):
		"Launch Normal":
			pid = OS.execute(kagPath + "/KAG.exe",[],false);
		"Launch Dedicated Server":
			pid = OS.execute(kagPath + "/KAG.exe",["noautoupdate", "nolauncher", "autostart", "Scripts/server_autostart.as", "autoconfig", "autoconfig.cfg"],false);
		"Launch Local Host":
			pid = OS.execute(kagPath + "/KAG.exe",["nolauncher", "autostart","Scripts/localhost.as"],true,output);
	#for item in output:
		#print(item);
