extends Control

onready var client = get_node('/root/client')

func _on_LoginButton_pressed():
	if($Username.text != "" and $Password.text != ""):
		$Error.text = ""
		client.send_combined(1005,$Username.text)
		client.send_combined(1006,$Password.text)
	else:
		$Error.text = "You need to enter username \n and password."
