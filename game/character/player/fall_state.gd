extends State
class_name PlayerFallState

@export var player: PlayerMain
@export var camera: Camera3D

var lerp_speed: float = 25.0
var direction = Vector3.ZERO
var camera_side: int = 0

func Enter(): pass

func Update(delta: float):
	camera_side = int(Input.get_axis("right", "left"))
	camera.rotation.z = lerp(camera.rotation.z, deg_to_rad(1.5 * camera_side) , 2 * delta)
	

	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var to_direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if player.is_on_floor() and !to_direction: state_transition.emit(self, "IdleState")
	#elif player.is_on_floor() and to_direction: state_transition.emit(self, "MoveState")
	if player.is_on_floor(): 
		if !to_direction: state_transition.emit(self, "IdleState")
		elif to_direction: state_transition.emit(self, "MoveState")
		return


	if to_direction:
		player.velocity.x = to_direction.x * player.current_speed * delta
		player.velocity.z = to_direction.z * player.current_speed * delta
		#if player.is_on_floor(): state_transition.emit(self, "MoveState")
	#else: if player.is_on_floor(): state_transition.emit(self, "IdleState")
