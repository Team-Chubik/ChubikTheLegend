extends Node

onready var client = get_node('/root/client')

func _on_Button_pressed():
	$VSplitContainer/Error.text = ""
	var username = $VSplitContainer/UpPart/BottomPart/inputs/Username.text
	var mail = $VSplitContainer/UpPart/BottomPart/inputs/Email.text
	var password = $VSplitContainer/UpPart/BottomPart/inputs/Password.text
	var passwordAgain = $VSplitContainer/UpPart/BottomPart/inputs/PasswordAgain.text
	
	if (username and mail and password and passwordAgain):
		if (password== passwordAgain):
			var send_info = username + ";" + password + ";" + mail
			client.send_combined(1006, send_info)
		else:
			$VSplitContainer/Error.text = "Passwords do not match"
	else:
		$VSplitContainer/Error.text = "You need to fill in all boxes"
