extends Button

@export var window_scene: PackedScene

var _active_window: Window

func _pressed() -> void:
	_active_window = window_scene.instantiate() as Window
	_active_window.close_requested.connect(_on_window_close_requested)
	add_child(_active_window)
	_active_window.popup_centered()

func _on_window_close_requested() -> void:
	_active_window.queue_free()
	_active_window = null
