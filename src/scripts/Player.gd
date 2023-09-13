extends RigidBody2D

var _initial_transform
var reset_state_pos = null

# Called when the node enters the scene tree for the first time.
func _ready():
    _initial_transform = transform
    apply_impulse(Vector2(0, -1500))
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func reset_states(pos):
    reset_state_pos = pos
    
func _integrate_forces(state):
    if reset_state_pos:
        state.transform = Transform2D(0.0, reset_state_pos)
        linear_velocity = Vector2.ZERO
        reset_state_pos = null
        apply_impulse(Vector2(0, -1500))
