extends Button

@onready var task_manager = get_tree().get_current_scene()
@onready var task = get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(self._show_delete_dialog)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _show_delete_dialog():
	print("delete pressed")
	var delete_dialog : ConfirmationDialog = ConfirmationDialog.new()
	delete_dialog.title = "Delete task"
	delete_dialog.dialog_text = "Are you sure you want to delete the task " + str(task.name) + "? This can't be undone."
	add_child(delete_dialog)
	delete_dialog.show()
	
	delete_dialog.get_ok_button().pressed.connect(_delete_task)
	delete_dialog.get_cancel_button().pressed.connect(_delete_task_cancelled)
	
func _delete_task():
	print("DELETE TASK")
	_delete_related_button(task)
	task.queue_free()

func _delete_related_button(task):
	var buttons = task_manager.get_task_buttons()
	buttons[buttons.find(task)].queue_free() 

func _delete_task_cancelled():
	print("DELETE TASK CANCELLED")
