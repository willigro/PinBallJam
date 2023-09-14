@tool
extends StaticBody2D

var _force_of_impulse = Vector2.ZERO

enum Type {WEAK, NORMAL, STRONG}
@export var _type: Type

@onready var hit_audio_player = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
    match _type:
        Type.WEAK:
            _force_of_impulse = Vector2(300, 300)
            $Sprite2D.modulate = Color(1, 1, 1)
        Type.NORMAL:
            _force_of_impulse = Vector2(500, 500)
            $Sprite2D.modulate = Color(0, 0, 1)
        Type.STRONG:
            _force_of_impulse = Vector2(1000, 1000)
            $Sprite2D.modulate = Color(1, 0, 0)
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_area_2d_body_entered(body):
    if(body.is_in_group("PLAYER")):
        var look_vec = (body.global_position - global_position).normalized()
        print(look_vec)
        #var dir = atan2(look_vec.y, look_vec.x)
        var vel = _force_of_impulse * look_vec
        print("touch")
        body.linear_velocity = vel
        print(body.linear_velocity)
        hit_audio_player.play()
    pass # Replace with function body.
