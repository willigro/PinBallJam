@tool
extends StaticBody2D

var _force_of_impulse = Vector2.ZERO

enum Type {WEAK, NORMAL, STRONG}
@export var _type: Type

@onready var hit_audio_player = $AudioStreamPlayer2D

var _point = 0

signal point(arg)

# Called when the node enters the scene tree for the first time.
func _ready():
	match _type:
		Type.WEAK:
			_force_of_impulse = Vector2(300, 300)
			$Sprite2D.modulate = Color(1, 1, 1)
			_point = 10
		Type.NORMAL:
			_force_of_impulse = Vector2(500, 500)
			$Sprite2D.modulate = Color(0, 0, 1)
			_point = 20
		Type.STRONG:
			_force_of_impulse = Vector2(1000, 1000)
			$Sprite2D.modulate = Color(1, 0, 0)
			_point = 50
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if(body.is_in_group("PLAYER")):
		var look_vec = (body.global_position - global_position).normalized()
		var vel = _force_of_impulse * look_vec
		body.linear_velocity = vel
		hit_audio_player.play()
		
		emit_signal("point", _point)
		
	pass # Replace with function body.
