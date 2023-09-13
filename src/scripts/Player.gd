extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
    apply_impulse(Vector2(0, -1500))
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
