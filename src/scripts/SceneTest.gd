extends Node2D

var FORCE_FACTOR = 500
var _initial_force = 300
var _max_force = 1500
var _current_force = _initial_force

# Called when the node enters the scene tree for the first time.
func _ready():
    $Player1.set_global_position($Marker2D.get_global_position())
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if Input.is_action_just_pressed("space"):
        $Player1.reset_states($Marker2D.get_global_position())
        
    if Input.is_action_pressed("click"):
        _current_force += FORCE_FACTOR * delta
        if _current_force > _max_force:
            _current_force = _max_force
        print(_current_force)
    
    if Input.is_action_just_released("click"):
        $Player1.push(Vector2(0, -_current_force))
        _current_force = _initial_force
    pass
