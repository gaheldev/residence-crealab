extends Camera3D
@export var to_follow:CharacterBody3D
var pos_origin:Vector3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pos_origin=position
	position=to_follow.position+pos_origin
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position=position.lerp(to_follow.position+pos_origin,1*delta)
	pass
