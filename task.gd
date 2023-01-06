extends ConfirmationDialog

signal new_task_name(new_task_name)
signal due_date(due_date)

@onready var task_container : VBoxContainer = $VBoxContainer
@onready var task_name = $VBoxContainer/LineEdit
@onready var task_name_old = $VBoxContainer/LineEdit.text

@onready var task_description = $VBoxContainer/TextEdit
@onready var task_description_old = $VBoxContainer/TextEdit.text

@onready var task_due_date = $VBoxContainer/LineEdit2
@onready var task_due_date_old = $VBoxContainer/LineEdit2.text

@onready var task_done = $VBoxContainer/CheckBox

@onready var task_button_name : String = str(name) + "_button"
@onready var task_button : Button = get_tree().get_current_scene().find_child(task_button_name, true, false)


func _ready():
	get_ok_button().pressed.connect(self._ok_button_pressed)
	get_cancel_button().pressed.connect(self._cancel_button_pressed)
	task_name.text = name

func _update_task_name(updated_task_name : String):
	task_name.text = updated_task_name

func _ok_button_pressed():
	emit_signal("new_task_name", task_name.text)
	emit_signal("due_date", task_due_date.text)
	print("ok")
	
func _cancel_button_pressed():
	print("cancel")
	task_name.text = task_name_old
	task_description.text = task_description_old
	task_due_date.text = task_due_date_old

func get_due_date():
	return task_due_date.text
