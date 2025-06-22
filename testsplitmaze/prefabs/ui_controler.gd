extends Node3D

@export var to_follow:CharacterBody3D
@export var Control_manager:Node

# Called when the node enters the scene tree for the first time.
var ofset=Vector3.UP*2
func _ready() -> void:
	global_position=to_follow.global_position+ofset

	pass # Replace with function body.

func control(controller_num):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position=to_follow.global_position+ofset

	pass
