extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@export var songs: Array[AudioStream] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if songs.size() <= 0:
		printerr("No Songs are defined! Not playing any music.")
	audio_stream_player.stream = songs[0]
	audio_stream_player.play()


func _on_audio_stream_player_finished() -> void:
	if songs.find(audio_stream_player.stream) + 1 < songs.size():
		audio_stream_player.stream = songs[songs.find(audio_stream_player.stream) + 1]
	else:
		audio_stream_player.stream = songs[0]
	audio_stream_player.play()
