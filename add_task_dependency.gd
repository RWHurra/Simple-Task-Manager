extends Button

@onready var add_task_list_dependency_scene = preload("res://add_task_list_dependency.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	_open_task_list()

func _open_task_list():
	var add_task_list_dependency_instance = add_task_list_dependency_scene.instantiate()
	add_sibling(add_task_list_dependency_instance)
	add_task_list_dependency_instance.show()
	
