extends VBoxContainer

@onready var task = preload("res://task.tscn")
@onready var task_button = preload("res://task_button.tscn")
@onready var task_dictionary : Dictionary
@onready var task_array : Array
@onready var task_button_dictionary : Dictionary
@onready var task_button_array : Array
@onready var task_counter : int = 1

func _ready():
	pass # Replace with function body.


func _process(_delta):
	pass

func create_task(task_name : String):
	var new_task = task.instantiate()
	new_task.name = task_name
	new_task.hide()
	add_child(new_task)
	task_dictionary = {
		"task_id": task_counter,
		"task_object": new_task,
		"task_name": new_task.name,
		"task_description": "",
		"task_due_date": ""
		}
	task_array.append(new_task)
	task_counter = task_counter + 1
	print("create task from parent")
	return new_task

func create_task_button(button_text : String, task):
	#create new button
	var new_button = task_button.instantiate()
	new_button.set_related_task(task)
	new_button.text = button_text
	new_button.name = str(button_text) + "_button"
	add_child(new_button)
	task_button_dictionary = {
		"related_task_id": task_counter,
		"task_button_object": new_button,
		"related_task_object": task,
		"task_button_name": new_button.name
		}
	task_button_array.append(new_button)

func get_tasks():
	return task_array
	
func get_task_buttons():
	return task_button_array
