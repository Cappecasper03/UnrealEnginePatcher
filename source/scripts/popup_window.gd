extends Window

@export var close_button: Button

func _ready() -> void:
	close_button.pressed.connect(close_requested.emit)
