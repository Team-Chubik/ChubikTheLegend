extends RichTextLabel 

var _val

func _ready(): 
	_val = connect("meta_clicked", self, "meta_clicked")

func meta_clicked(meta): 
	var data = meta.split(",", true)
	if (str(data[1]) == "https://discord.com/users/573080354567487499"): 
		_val = OS.shell_open("https://discord.com/users/573080354567487499")
	elif (str(data[1]) == "https://www.twitch.tv/tucniklinux"):
		_val =OS.shell_open("https://www.twitch.tv/tucniklinux")
	elif (str(data[1]) == "https://discord.com/users/422495285789327372"):
		_val = OS.shell_open("https://discord.com/users/422495285789327372")
	elif (str(data[1]) == "https://github.com/NeonflameCZ"):
		_val = OS.shell_open("https://github.com/NeonflameCZ")
	elif (str(data[1]) == "https://www.youtube.com/channel/UC7oj3oFxp4C4AFuVlDpSeEg"):
		_val = OS.shell_open("https://www.youtube.com/channel/UC7oj3oFxp4C4AFuVlDpSeEg")
	elif (str(data[1]) == "https://github.com/Blboun3"):
		_val = OS.shell_open("https://github.com/Blboun3")
	elif (str(data[1]) == "https://github.com/Vagabe"):
		_val = OS.shell_open("https://github.com/Vagabe")
		

