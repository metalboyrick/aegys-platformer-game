extends KinematicBody2D

signal killed()
signal kill_player()

const SPEED = 50
const GRAVITY = 30
const UP = Vector2(0, -1)

var direction = -1
var motion = Vector2()
var attacked = false
var isDead = false
var cleanUp = false

func _ready():
	cleanUp = false
	isDead = false
	pass
	
func dead():
	isDead = true
	motion = Vector2(0,0)
	$CollisionShape2D.set("disabled", true)
	$AnimatedSprite.play("Die")
	emit_signal("killed")
	
	
	
func _physics_process(delta):
	if isDead == false:
		motion.y += GRAVITY
		motion.x = SPEED * direction
	
	if direction == -1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true	
	
	if is_on_wall():
		direction *= -1
		$RayCast2D.position.x *= -1	
		
	if not $RayCast2D.is_colliding():
		direction *= -1
		$RayCast2D.position.x *= -1	
		
	motion = move_and_slide(motion, UP)	
	
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				emit_signal("kill_player")
		

func _on_Player__attacks():
	dead()

