extends Node

@export var tab_container : TabContainer

@export var target_path : TextEdit
@export var target_path_button : Button

@export var add_patch_button : Button

var dir_dialog : FileDialog

func _ready():
	target_path_button.pressed.connect(_on_select_folder_pressed)

	add_patch_button.pressed.connect(_on_add_patch_pressed)

	dir_dialog = FileDialog.new()
	dir_dialog.use_native_dialog = true
	dir_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	dir_dialog.access = FileDialog.ACCESS_FILESYSTEM
	dir_dialog.dir_selected.connect(_on_dir_selected)
	add_child(dir_dialog)

func _on_select_folder_pressed():
	dir_dialog.popup_centered()

func _on_dir_selected(path: String):
	target_path.text = path

func _on_add_patch_pressed():
	tab_container.current_tab = 1
