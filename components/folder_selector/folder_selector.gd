@tool
extends Node

@export var placeholder_text : String:
	set(value):
		placeholder_text = value
		if is_inside_tree() and text_edit:
			text_edit.placeholder_text = value

@onready var text_edit : TextEdit = $HBoxContainer/TextEdit
@onready var button : Button = $HBoxContainer/Button

var dir_dialog : FileDialog

func _ready():
	if text_edit:
		text_edit.placeholder_text = placeholder_text
	
	if Engine.is_editor_hint():
		return
	
	dir_dialog = FileDialog.new()
	dir_dialog.use_native_dialog = true
	dir_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	dir_dialog.access = FileDialog.ACCESS_FILESYSTEM
	dir_dialog.dir_selected.connect(_on_dir_selected)
	add_child(dir_dialog)
	
	text_edit.placeholder_text = placeholder_text

	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	dir_dialog.popup_centered_ratio(0.5)

func _on_dir_selected(path: String):
	text_edit.text = path
