extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_area_2d_body_entered(body):
    if(body.is_in_group("PLAYER")):
        body.apply_impulse(Vector2(-100, -350))
        #var col = body.move_and_collide(Vector2(-300, -350))
        #if col:
        #body.linear_velocity = body.linear_velocity.bounce(Vector2(0, 0))
        #body.linear_velocity = Vector2(-300, -350)
    pass # Replace with function body.
