extends Node3D

class_name DistanceSensor

@export var length : float = 30
@onready var ray : RayCast3D = $RayCast3D
@onready var target : MeshInstance3D = $TargetHit
@onready var targetCylinder : MeshInstance3D = $TargetCylinder

var point : Vector3 = Vector3(0,0,0)

func _ready() -> void:
	ray.target_position = Vector3(0,length,0)

func fire() -> float:
	if(!ray.is_colliding()):
		target.visible = false
		targetCylinder.visible = false
		return -1
		
	target.visible = true
	targetCylinder.visible = true
		
	point = ray.get_collision_point()
	target.global_position = point
	
	var displacement : Vector3 = point - ray.global_position
	var length : float = displacement.length()
	
	targetCylinder.scale.y = length / 2
	targetCylinder.position.y = length/2
	
	return length
