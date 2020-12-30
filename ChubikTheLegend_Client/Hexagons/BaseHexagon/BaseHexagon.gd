extends RigidBody

# Načtení barevných materiálů
onready var green = load("res://assets/Materials/green.tres")
onready var white = load("res://assets/Materials/white.tres")
onready var yellow = load("res://assets/Materials/yellow.tres")

# Načtení globálních proměnných
onready var global = get_node('/root/globals')

# Získání unkátního identifikátoru
var id = self.get_instance_id()

# Nastavení "selected" na false
var selected = false

# funkce "_ready" => při načtení, nastaví správné barvy
func _ready():
	$Circle.set_surface_material(0,green)
	$Circle001.set_surface_material(0,green)
	$Circle002.set_surface_material(0,green)
	$Circle.set_surface_material(1,white)
	$Circle001.set_surface_material(1,white)
	$Circle002.set_surface_material(1,white)

# funkce "_process" => každý game tick, jestliže není selected tak se nastav na bílou
func _process(_delta):
	if(global.activeID != id):
		$Circle.set_surface_material(1,white)
		$Circle001.set_surface_material(1,white)
		$Circle002.set_surface_material(1,white)
		selected = false

# Při kliknutí změna stavu "active" [true/false]
func _on_ClickBox_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				if(selected):
					$Circle.set_surface_material(1,white)
					$Circle001.set_surface_material(1,white)
					$Circle002.set_surface_material(1,white)
					selected = false
				else:
					$Circle.set_surface_material(1,yellow)
					$Circle001.set_surface_material(1,yellow)
					$Circle002.set_surface_material(1,yellow)
					global.activeID = id
					selected = true
