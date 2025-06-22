extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var player=0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if player==0:
		if Input.is_action_just_pressed("p1_action") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	if player==1:
		if Input.is_action_just_pressed("p2_action") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var input_dir1 := Input.get_vector("p1_left", "p1_right", "p1_up", "p1_down")
	
	var input_dir2 = Input.get_vector("p2_left", "p2_right", "p2_up", "p2_down")

	####
	####
	####
	var threshold=0.1
	if (input_dir1.x>threshold):
		print("droite")
	if (input_dir1.x<-threshold):
		print("gauche")
	if (input_dir1.y>threshold):
		print("bas")
	if (input_dir1.y<-threshold):
		print("haut")
	
	
	#
	#var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
#
	#move_and_slide()
