extends Control

onready var client = get_node('/root/client')

func _on_LoginButton_pressed():
	if($Username.text != "" and $Password.text != ""):
		$Error.text = ""
		var to_send = $Username.text + ";" + $Password.text
		client.send_combined(1005, to_send)
	else:
		$Error.text = "You need to enter username \n and password."

