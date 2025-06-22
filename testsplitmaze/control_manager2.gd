extends Node


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var characters:Array[CharacterBody3D]

var controlled_by: Array


func _ready() -> void:
	controlled_by = range(characters.size())

# A: character 0
# B: character 1
# X: character 2
# Y: character 3
func _input(event: InputEvent) -> void:	# Handle jump.
	for controller in range(characters.size()):
		var p_ = "p" + str(controller) + "_" 
		if Input.is_action_just_pressed(p_ + "A"):
			controlled_by[controller] = 0
			
		if Input.is_action_just_pressed(p_ + "B"):
			controlled_by[controller] = 1
			
		if Input.is_action_just_pressed(p_ + "X"):
			controlled_by[controller] = 2
			#$"../Control/HBoxContainer/VBoxContainer_p1/ColorRect_p1".color=Color(1, 0, 0, 1)
			#p1_control=0
			
		if Input.is_action_just_pressed(p_ + "Y"):
			controlled_by[controller] = 3
			#$"../Control/HBoxContainer/VBoxContainer_p1/ColorRect_p1".color=Color(0, 0, 1, 1)
			#p1_control=1

		if Input.is_action_just_pressed(p_ + "action"):
			characters[controlled_by[controller]].jump = true
			Input.start_joy_vibration(controller,0.1,0.5,0.3)

	####
	####
	####
	#var p0L:Vector3=Vector3.ZERO
	#var p0R:Vector3=Vector3.ZERO
	#var p0U:Vector3=Vector3.ZERO
	#var p0D:Vector3=Vector3.ZERO
#
	#var p1L:Vector3=Vector3.ZERO
	#var p1R:Vector3=Vector3.ZERO
	#var p1U:Vector3=Vector3.ZERO
	#var p1D:Vector3=Vector3.ZERO
#
	#var p2L:Vector3=Vector3.ZERO
	#var p2R:Vector3=Vector3.ZERO
	#var p2U:Vector3=Vector3.ZERO
	#var p2D:Vector3=Vector3.ZERO
#
	#var p3L:Vector3=Vector3.ZERO
	#var p3R:Vector3=Vector3.ZERO
	#var p3U:Vector3=Vector3.ZERO
	#var p3D:Vector3=Vector3.ZERO
	
	var p0_dir: Vector3 = Vector3.ZERO
	var p1_dir: Vector3 = Vector3.ZERO
	var p2_dir: Vector3 = Vector3.ZERO
	var p3_dir: Vector3 = Vector3.ZERO

	var threshold=0.1

	var p_dir = [Vector3.ZERO, Vector3.ZERO, Vector3.ZERO, Vector3.ZERO]
	
	var input_dir_0 := Input.get_vector("p0_left", "p0_right", "p0_up", "p0_down")
	if (input_dir_0.x>threshold):
		p_dir[0] += input_dir_0.x*Vector3.RIGHT
	if (input_dir_0.x<-threshold):
		p_dir[0] += input_dir_0.x*Vector3.RIGHT
	if (input_dir_0.y>threshold):
		p_dir[0] += input_dir_0.y*Vector3.BACK
	if (input_dir_0.y<-threshold):
		p_dir[0] += input_dir_0.y*Vector3.BACK

	var input_dir_1 := Input.get_vector("p1_left", "p1_right", "p1_up", "p1_down")
	if (input_dir_1.x>threshold):
		p_dir[1] += input_dir_1.x*Vector3.RIGHT
	if (input_dir_1.x<-threshold):
		p_dir[1] += input_dir_1.x*Vector3.RIGHT
	if (input_dir_1.y>threshold):
		p_dir[1] += input_dir_1.y*Vector3.BACK
	if (input_dir_1.y<-threshold):
		p_dir[1] += input_dir_1.y*Vector3.BACK
	
	var input_dir_2 := Input.get_vector("p2_left", "p2_right", "p2_up", "p2_down")
	if (input_dir_2.x>threshold):
		p_dir[2] += input_dir_2.x*Vector3.RIGHT
	if (input_dir_2.x<-threshold):
		p_dir[2] += input_dir_2.x*Vector3.RIGHT
	if (input_dir_2.y>threshold):
		p_dir[2] += input_dir_2.y*Vector3.BACK
	if (input_dir_2.y<-threshold):
		p_dir[2] += input_dir_2.y*Vector3.BACK
	
	var input_dir_3 := Input.get_vector("p3_left", "p3_right", "p3_up", "p3_down")
	if (input_dir_3.x>threshold):
		p_dir[3] += input_dir_3.x*Vector3.RIGHT
	if (input_dir_3.x<-threshold):
		p_dir[3] += input_dir_3.x*Vector3.RIGHT
	if (input_dir_3.y>threshold):
		p_dir[3] += input_dir_3.y*Vector3.BACK
	if (input_dir_3.y<-threshold):
		p_dir[3] += input_dir_3.y*Vector3.BACK	
	
	for character in characters:
		character.direction=Vector3.ZERO
		print(controlled_by)
		for player in range(characters.size()):
			if  characters[controlled_by[player]] == character:
				character.direction += p_dir[player]


	#if p1_control!=-1:
		#player_list[p1_control].direction+=p1R+p1D
	#if p2_control!=-1:
		#player_list[p2_control].direction+=p2L+p2U
	
	
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
	
