extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

var elapsed: float = 0.0
var running: bool = false
var direction: bool = true

const TRANSITION_MIN: float = 0.0
const TRANSITION_MAX: float = 1.25
const TRANSITION_DURATION: float = 0.4

func _process(delta: float) -> void:
	if not running:
		return
	
	elapsed += delta
	var t: float = clampf(elapsed / TRANSITION_DURATION, 0.0, 1.0)
	var radius: float = lerp(TRANSITION_MIN, TRANSITION_MAX, t if direction else 1.0 - t)
	
	(color_rect.material as ShaderMaterial).set_shader_parameter("radius", radius)
	
	if elapsed >= TRANSITION_DURATION:
		running = false

func call_transition(dir: bool) -> void:
	direction = dir
	elapsed = 0.0
	running = true
