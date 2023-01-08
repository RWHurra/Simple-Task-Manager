extends Button

signal task_name(name)

@onready var task_manager : VBoxContainer = get_tree().get_current_scene()
@onready var tasks : Array
@onready var buttons : Array
@onready var related_task
var task : ConfirmationDialog

func _ready():
	pressed.connect(self._on_pressed)
	get_related_task().new_task_name.connect(_update_button_text)
	get_related_task().due_date.connect(_update_button_color)

func _on_pressed():
	show_task()

func _update_button_text(new_button_text : String):
	text = new_button_text
	
func _update_button_color(due_date):
	if due_date == str(Time.get_date_string_from_system()):
		print(due_date)
		
		var new_stylebox_normal = get_theme_stylebox("normal").duplicate()
		new_stylebox_normal.bg_color = Color.DARK_ORANGE
		add_theme_stylebox_override("normal", new_stylebox_normal)
		
		var new_stylebox_hover = get_theme_stylebox("hover").duplicate()
		new_stylebox_hover.bg_color = Color.ORANGE
		add_theme_stylebox_override("hover", new_stylebox_hover)

func show_task():
	get_related_task().show()

func get_related_task():
	return related_task

func set_related_task(task):
	related_task = task
