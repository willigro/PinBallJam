extends Node2D

var FORCE_FACTOR = 500
var _initial_force = 300
var _max_force = 1500
var _current_force = _initial_force
var _count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player1.set_global_position($Marker2D.get_global_position())
	
	for object in $Node2D.get_children():
		object.point.connect(add_point)
	
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

func add_point(point):
	_count = _count + point
	print(_count)
	pass
	


func _on_area_2d_body_entered(body):
	if(body.is_in_group("PLAYER")):
		$Player1.reset_states($Marker2D.get_global_position())
		_count = 0
	pass # Replace with function body.
