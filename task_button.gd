extends Button

signal task_name(name)

@onready var task_manager : VBoxContainer = get_tree().get_current_scene()
@onready var tasks : Array
@onready var buttons : Array
@onready var related_task
@onready var new_stylebox_normal = get_theme_stylebox("normal").duplicate()
@onready var new_stylebox_hover = get_theme_stylebox("hover").duplicate()

func _ready():
	pressed.connect(self._on_pressed)
	get_related_task().updated_task.connect(_update_task_data)

func _on_pressed():
	show_task()

func _update_task_data(new_task_name, new_task_due_date, new_task_done_status):
	_update_button_text(new_task_name)
	_update_button_color(new_task_due_date, new_task_done_status)

func _update_button_text(new_button_text : String):
	if new_button_text == text:
		return
	text = new_button_text
	
func _update_button_color(due_date, is_done):
	if is_done == true:
		_update_button_color_done()
		return
	if is_done == false:
		print("is done false!")
		_update_button_color_normal()
	if due_date == str(Time.get_date_string_from_system()):
		print(due_date)
		_update_button_color_today()

func _update_button_color_done():
	new_stylebox_normal.set_bg_color(Color.FOREST_GREEN)
	new_stylebox_hover.set_bg_color(Color.LIME_GREEN)
	add_theme_stylebox_override("normal", new_stylebox_normal)
	add_theme_stylebox_override("hover", new_stylebox_hover)

func _update_button_color_normal():
	remove_theme_stylebox_override("new_stylebox_normal")
	remove_theme_stylebox_override("new_stylebox_hover")

func _update_button_color_today():
	new_stylebox_normal.set_bg_color(Color.DARK_ORANGE)
	new_stylebox_hover.set_bg_color(Color.ORANGE)
	add_theme_stylebox_override("normal", new_stylebox_normal)
	add_theme_stylebox_override("hover", new_stylebox_hover)

func show_task():
	get_related_task().show()

func get_related_task():
	return related_task

func set_related_task(task):
	related_task = task
