extends Node

@export var scenes: Dictionary[String, PackedScene] = {}

func call_packed(scene: PackedScene) -> void:
	get_tree().change_scene_to_packed(scene)

func call_scene(scene: String) -> void:
	TransitionManager.call_transition(true)
	await get_tree().create_timer(TransitionManager.TRANSITION_DURATION).timeout
	var packed = scenes.get(scene)
	if !packed:
		prints("Scene", scene, "not found!")
		return
	call_packed(packed)
	TransitionManager.call_transition(false)
