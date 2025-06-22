extends Node


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var player1:CharacterBody3D
@export var player2:CharacterBody3D

@onready var player_list:Array=[player1,player2]
var p1L:Vector3=Vector3.ZERO
var p1R:Vector3=Vector3.ZERO
var p1U:Vector3=Vector3.ZERO
var p1D:Vector3=Vector3.ZERO

var p2L:Vector3=Vector3.ZERO
var p2R:Vector3=Vector3.ZERO
var p2U:Vector3=Vector3.ZERO
var p2D:Vector3=Vector3.ZERO

var p1_control=-1
var p2_control=-1

func _ready() -> void:
	print(player_list)
func _input(event: InputEvent) -> void:	# Handle jump.
	if Input.is_action_just_pressed("p1_X"):
		$"../Control/HBoxContainer/VBoxContainer_p1/ColorRect_p1".color=Color(1, 0, 0, 1)
		p1_control=0
	if Input.is_action_just_pressed("p1_Y"):
		$"../Control/HBoxContainer/VBoxContainer_p1/ColorRect_p1".color=Color(0, 0, 1, 1)
		p1_control=1
		
	if Input.is_action_just_pressed("p2_X"):
		$"../Control/HBoxContainer/VBoxContainer_p2/ColorRect_p2".color=Color(1, 0, 0, 1)
		p2_control=0
	if Input.is_action_just_pressed("p2_Y"):
		$"../Control/HBoxContainer/VBoxContainer_p2/ColorRect_p2".color=Color(0, 0, 1, 1)
		p2_control=1


	if Input.is_action_just_pressed("p1_action"):
		if p1_control!=-1:
			player_list[p1_control].jump=true
			
			Input.start_joy_vibration(2,0.1,0.5,0.3)
#
		#velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("p2_action"):
		if p2_control!=-1:
			player_list[p2_control].jump=true
			Input.start_joy_vibration(1,1,1,0.1)
#
		#velocity.y = JUMP_VELOCITY

	####
	####
	####
	p1L=Vector3.ZERO
	p1R=Vector3.ZERO
	p1U=Vector3.ZERO
	p1D=Vector3.ZERO

	p2L=Vector3.ZERO
	p2R=Vector3.ZERO
	p2U=Vector3.ZERO
	p2D=Vector3.ZERO

	
	var input_dir := Input.get_vector("p1_left", "p1_right", "p1_up", "p1_down")
	var threshold=0.1
	if (input_dir.x>threshold):
		p1R=input_dir.x*Vector3.RIGHT
	if (input_dir.x<-threshold):
		p1L=input_dir.x*Vector3.RIGHT
	if (input_dir.y>threshold):
		p1D=input_dir.y*Vector3.BACK
	if (input_dir.y<-threshold):
		p1U=input_dir.y*Vector3.BACK
	
	var input_dir2 := Input.get_vector("p2_left", "p2_right", "p2_up", "p2_down")
	#var threshold=0.1
	if (input_dir2.x>threshold):
		p2R=input_dir2.x*Vector3.RIGHT
	if (input_dir2.x<-threshold):
		p2L=input_dir2.x*Vector3.RIGHT
	if (input_dir2.y>threshold):
		p2D=input_dir2.y*Vector3.BACK
	if (input_dir2.y<-threshold):
		p2U=input_dir2.y*Vector3.BACK
	
	
	
	for i in player_list:
		i.direction=Vector3.ZERO
	
	
	if p1_control!=-1:
		player_list[p1_control].direction+=p1R+p1D
	if p2_control!=-1:
		player_list[p2_control].direction+=p2L+p2U
	
	
#	var tmp_direction_joueur1=(1-p2_control)*(p2L+p2U)+(1-p1_control)*(p1L+p1U)
	#
	#if p1_control!=-1:
		#player_list[p1_control].direction+=Vector3.RIGHT*input_dir2.x+Vector3.BACK*input_dir.y
	#if p2_control!=-1:
		#player_list[p1_control].direction=tmp_direction_p2
	#
	
	
	#if p1_control!=-1:
		#player_list[p1_control].direction=true
		
		#Input.start_joy_vibration(2,0.1,0.5,0.3)
	
