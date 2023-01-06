extends Button

@onready var task_manager = get_parent()
# Create an InputEvent node to handle user input
#@onready var input_event = InputEvent.new()
@onready var newButton : Button = Button.new()
# Create a new LineEdit node
@onready var line_edit = LineEdit.new()
@onready var width = size.x
@onready var task = preload("res://task.tscn")
@onready var task_button = preload("res://task_button.tscn")
@onready var new_task
@onready var task_dictionary : Dictionary
@onready var task_array : Array
@onready var task_button_dictionary : Dictionary
@onready var task_button_array : Array
@onready var task_counter : int = 1

func _ready():
	pressed.connect(self._button_pressed)
	add_child(line_edit)
	# Set the placeholder text of the LineEdit
	line_edit.placeholder_text = "Enter task name"
	line_edit.expand_to_text_length = true
	line_edit.position = Vector2(width + 50, 0)

func _process(_delta):
	width = size.x
	line_edit.position = Vector2(width + 10, 0)

func _button_pressed():
	# GUARD CLAUSE: if new task has no name
	if line_edit.text == null || line_edit.text == "":
		print("Task must have a name")
		_create_acceptdialog_missing_name()
		return

	new_task = task_manager.create_task(line_edit.text)
	task_manager.create_task_button(line_edit.text, new_task)
	line_edit.clear()

func _create_acceptdialog_missing_name():
	var accept_dialog = AcceptDialog.new()
	# set the title and message of the AcceptDialog
	accept_dialog.title = "Warning"
	accept_dialog.dialog_text = "This is a warning message. You did not entered a task name!"
	accept_dialog.position = Vector2(100, 100)
	# show the AcceptDialog
	add_child(accept_dialog)
	accept_dialog.visible = true
