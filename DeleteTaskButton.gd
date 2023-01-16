extends Button

@onready var task_manager = get_tree().get_current_scene()
@onready var task = get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(self._show_delete_dialog)

func _show_delete_dialog():
	var delete_dialog : ConfirmationDialog = ConfirmationDialog.new()
	delete_dialog.title = "Delete task"
	delete_dialog.dialog_text = "Are you sure you want to delete the task " + str(task.name) + "? This can't be undone."
	add_child(delete_dialog)
	delete_dialog.show()
	
	delete_dialog.get_ok_button().pressed.connect(_delete)
	delete_dialog.get_cancel_button().pressed.connect(_delete_task_cancelled)
	
func _delete():
	_delete_related_button(task)
	_delete_task()

func _delete_task():
	var tasks = task_manager.get_tasks()
	tasks.erase(task)
	task.queue_free()

func _delete_related_button(task_to_delete):
	var buttons = task_manager.get_task_buttons()
	print(buttons)
	for button in buttons:
		if task_to_delete.name == str(button.name).replace("_button", ""):
			buttons.erase(button)
			button.queue_free()

func _delete_task_cancelled():
	print("DELETE TASK CANCELLED")
