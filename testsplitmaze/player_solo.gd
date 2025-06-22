extends CharacterBody3D

enum {RUN,WALK,IDLE}
var curAnim=IDLE
@export var blend_speed=15

const SPEED = 10.0
const JUMP_VELOCITY = 4.5
var jump:bool=false
var direction:Vector3=Vector3.ZERO
@onready var anim_tree=$AuxScene.get_node("AnimationTree")
var run_val:float=0

func handle_animation(delta):
	match curAnim:
		IDLE:
			run_val=lerpf(run_val,0,blend_speed*delta)
		RUN:
			run_val=lerpf(run_val,1,blend_speed*delta)

func update_tree():
	anim_tree["parameters/Run/blend_amount"]=run_val

func _physics_process(delta: float) -> void:
	handle_animation(delta)
	update_tree()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if jump and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump=false
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	if direction.length()>0.1:
		curAnim=RUN
		var target_rotation = transform.looking_at(global_transform.origin + direction, Vector3.UP).basis
		transform.basis = target_rotation
	else:
		curAnim=IDLE

	move_and_slide()
