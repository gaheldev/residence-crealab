extends Node


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var player1:CharacterBody3D
@export var player2:CharacterBody3D
var p1L:Vector3=Vector3.ZERO
var p1R:Vector3=Vector3.ZERO
var p1U:Vector3=Vector3.ZERO
var p1D:Vector3=Vector3.ZERO

var p2L:Vector3=Vector3.ZERO
var p2R:Vector3=Vector3.ZERO
var p2U:Vector3=Vector3.ZERO
var p2D:Vector3=Vector3.ZERO

func _input(event: InputEvent) -> void:	# Handle jump.
	if Input.is_action_just_pressed("p1_action"):
		player1.jump=true
		#velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("p2_action"):
		player2.jump=true

		#velocity.y = JUMP_VELOCITY

	####
	####
	####
	
	var input_dir := Input.get_vector("p1_left", "p1_right", "p1_up", "p1_down")
	var threshold=0.1
	if (input_dir.x>threshold):
		print("droite")
		p1R=input_dir.x*Vector3.RIGHT
	if (input_dir.x<-threshold):
		print("gauche")
		p1L=input_dir.x*Vector3.RIGHT
	if (input_dir.y>threshold):
		print("bas")
		p1D=input_dir.y*Vector3.UP
	if (input_dir.y<-threshold):
		print("haut")
		p1U=input_dir.y*Vector3.UP
	
	var input_dir2 := Input.get_vector("p2_left", "p2_right", "p2_up", "p2_down")
	#var threshold=0.1
	if (input_dir2.x>threshold):
		p2R=input_dir.x*Vector3.RIGHT
		print(str(p2R))
	if (input_dir2.x<-threshold):
		p2L=input_dir.x*Vector3.RIGHT
	if (input_dir2.y>threshold):
		p2D=input_dir.y*Vector3.UP
	if (input_dir2.y<-threshold):
		p2U=input_dir.y*Vector3.UP
	
	player1.direction=p1U+p1D+p2L+p2R
	print("p1:"+str(player1.direction))
	player2.direction=p2U+p2D+p1L+p1R


	#input_dir = Input.get_vector("p2_left", "p2_right", "p2_up", "p2_down")
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
	
