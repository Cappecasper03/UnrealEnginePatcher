extends Button

@export var text_edit: TextEdit

var _dir_dialog: FileDialog

func _ready() -> void:
	_dir_dialog = FileDialog.new()
	_dir_dialog.use_native_dialog = true
	_dir_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	_dir_dialog.access = FileDialog.ACCESS_FILESYSTEM
	_dir_dialog.dir_selected.connect(_on_selected)
	add_child(_dir_dialog)

func _pressed() -> void:
	_dir_dialog.popup_centered()

func _on_selected(path: String) -> void:
	text_edit.text = path
