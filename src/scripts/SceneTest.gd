extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    $Player1.set_global_position($Marker2D.get_global_position())
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if Input.is_action_pressed("click"):
        $Player1.reset_states($Marker2D.get_global_position())
    pass
