extends Control

# Na začátku nechat vidět jenom tlačítka
func _ready():
	$Login.hide()
	$Signup.hide()
	$Back.hide()
	$Buttons.show()

# Login => Schovat všechno ostatní, jenom login a "back"
func _on_HaveAccount_pressed():
	$Login.show()
	$Signup.hide()
	$Buttons.hide()
	$Back.show()
# Signup => Schovat všechno ostatní, jenom signup a "back"
func _on_DontHaveAccount_pressed():
	$Login.hide()
	$Signup.show()
	$Buttons.hide()
	$Back.show()

# Zptáky => reset do původního nastavení
func _on_Back_pressed():
	$Login.hide()
	$Signup.hide()
	$Back.hide()
	$Buttons.show()
