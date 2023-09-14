extends StaticBody2D

var _force_of_impulse = Vector2(500, 500)

# Called when the node enters the scene tree for the first time.
func _ready():
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
    pass # Replace with function body.
