extends RigidBody

# Načtení barevných materilů
onready var green = load("res://assets/Materials/green.tres")
onready var white = load("res://assets/Materials/white.tres")
onready var blue = load("res://assets/Materials/blue.tres")
onready var yellow = load("res://assets/Materials/yellow.tres")

# Načtení globálních proměnných
onready var global = get_node('/root/globals')

# Získání unikátního identifikátoru
var id = self.get_instance_id()

# Nastavení hodnoty selected na false
var selected = false

# Funkce "_ready" => při načtení nastav barvy na default
func _ready():
	$Circle.set_surface_material(0,green)
	$Circle.set_surface_material(1,white)
	$Cylinder.set_surface_material(0,blue)

# Funkce "_process" => každý game tick, jestli není vybrán nastav barvu na bílou
func _process(_delta):
	if(global.activeID != id):
		$Circle.set_surface_material(1,white)
		selected = false

# Při kliknutí změna stavu active [true/false]
func _on_ClickBox_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				if(selected):
					$Circle.set_surface_material(1,white)
					selected = false
				else:
					$Circle.set_surface_material(1,yellow)
					global.activeID = id
					selected = true

