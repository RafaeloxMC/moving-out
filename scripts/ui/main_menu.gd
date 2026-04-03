extends Control

@onready var settings: Button = $BackgroundContainer/Camera2D/CanvasLayer/ButtonContainer/Settings

func _on_play_pressed() -> void:
	SceneManager.call_scene("game")

func _on_settings_pressed() -> void:
	settings.text = "Settings - currently WIP!"

func _on_quit_pressed() -> void:
	get_tree().quit()
