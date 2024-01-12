extends RigidBody2D

@export var ball: Ball
@export var paddle_speed = 35000

func _physics_process(delta):
	var direction = (ball.position - position).normalized()
	linear_velocity.y = direction.y * paddle_speed * delta
