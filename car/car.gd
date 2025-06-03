extends VehicleBody3D

@export var maxSteer : float = 0.5
@export var power : float = 100

@export var distanceSensors : Array[DistanceSensor]

func _physics_process(delta: float) -> void:
	steering = move_toward(steering, -Input.get_axis("left", "right") * maxSteer, delta)
	engine_force = -Input.get_axis("forward", "backward") * power
	
	for sensor : DistanceSensor in distanceSensors:
		sensor.fire()
		
	return
	
