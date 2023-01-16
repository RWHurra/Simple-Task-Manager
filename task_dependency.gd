extends Control

@onready var simple_task_manager = get_tree().get_current_scene()

func _on_close_pressed():
	simple_task_manager.show()
	queue_free()
