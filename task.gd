extends ConfirmationDialog

signal updated_task(new_task_name, new_task_due_date, new_task_done_status)
signal due_date(due_date)

@onready var task_container : VBoxContainer = $VBoxContainer

@onready var task_name = $VBoxContainer/LineEdit
@onready var task_name_current

@onready var task_description = $VBoxContainer/TextEdit
@onready var task_description_current

@onready var task_due_date = $VBoxContainer/LineEdit2
@onready var task_due_date_current

@onready var task_done = $VBoxContainer/CheckBox

@onready var isDone : bool = false


func _ready():
	get_ok_button().pressed.connect(self._ok_button_pressed)
	get_cancel_button().pressed.connect(self._cancel_button_pressed)
	self.focus_entered.connect(_save_current_task_data)
	task_done.toggled.connect(self._toggle_task_done)
	task_name.text = name

func _toggle_task_done(button_pressed):
	if button_pressed and isDone == false:
		isDone = true
	else:
		isDone = false
	print("task isDOne is now: ", isDone)

func _save_current_task_data():
	task_name_current = task_name.text
	task_description_current = task_description.text
	task_due_date_current = task_due_date.text

func _update_task_name(updated_task_name : String):
	task_name.text = updated_task_name

func _ok_button_pressed():
	emit_signal("updated_task", task_name.text, task_due_date.text, isDone)
	
func _cancel_button_pressed():
	print("cancel")
	task_name.text = task_name_current
	task_description.text = task_description_current
	task_due_date.text = task_due_date_current

func get_due_date():
	return task_due_date.text
