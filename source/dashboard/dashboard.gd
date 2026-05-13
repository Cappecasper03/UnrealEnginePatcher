extends Node

@export var target_path : TextEdit
@export var target_path_button : Button

var dir_dialog : FileDialog

func _ready():
	target_path_button.pressed.connect(_on_button_pressed)

	dir_dialog = FileDialog.new()
	dir_dialog.use_native_dialog = true
	dir_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	dir_dialog.access = FileDialog.ACCESS_FILESYSTEM
	dir_dialog.dir_selected.connect(_on_dir_selected)
	add_child(dir_dialog)

func _on_button_pressed():
	dir_dialog.popup_centered_ratio(0.5)

func _on_dir_selected(path: String):
	target_path.text = path
