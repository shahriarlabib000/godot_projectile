extends RigidBody2D

const SPEED=400

@onready var ray=$RayCast2D
func _integrate_forces(_state: PhysicsDirectBodyState2D) -> void:
	apply_central_impulse( Vector2(1,0).rotated(rotation)*SPEED)
	
func _physics_process(delta: float) -> void:
	if ray.is_colliding():
		var col=ray.get_collider()
		if col.is_in_group("enemy"):
			ray.get_collider().hit()
		queue_free()
	
	
