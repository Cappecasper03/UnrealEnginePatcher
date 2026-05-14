extends Node

@export var original_path : TextEdit
@export var original_path_button : Button

@export var custom_path : TextEdit
@export var custom_path_button : Button

var dir_dialog : FileDialog

func _ready():
	original_path_button.pressed.connect(_on_select_original_folder_pressed)

	dir_dialog = FileDialog.new()
	dir_dialog.use_native_dialog = true
	dir_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	dir_dialog.access = FileDialog.ACCESS_FILESYSTEM
	add_child(dir_dialog)

func _on_select_original_folder_pressed():
	dir_dialog.dir_selected.connect(_on_original_dir_selected)
	dir_dialog.popup_centered_ratio(0.5)

func _on_original_dir_selected(path: String):
	original_path.text = path

func _on_select_custom_folder_pressed():
	dir_dialog.dir_selected.connect(_on_custom_dir_selected)
	dir_dialog.popup_centered_ratio(0.5)

func _on_custom_dir_selected(path: String):
	original_path.text = path
