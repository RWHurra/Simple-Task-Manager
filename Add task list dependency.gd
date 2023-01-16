extends ConfirmationDialog

@onready var item_list = $ItemList
@onready var simple_task_manager = get_tree().get_current_scene()
@onready var task_list = simple_task_manager.get_tasks()

# Called when the node enters the scene tree for the first time.
func _ready():
	print(task_list)
	for task in task_list:
		item_list.add_item(task.name, null, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
