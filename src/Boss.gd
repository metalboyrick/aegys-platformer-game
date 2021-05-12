extends KinematicBody2D

signal killed()
signal kill_player()
signal endgame()

const SPEED = 150
const GRAVITY = 30
const UP = Vector2(0, -1)

var direction = -1
var motion = Vector2()
var attacked = false
var isDead = false
var cleanUp = false
var HP = 20
var isIdle = true
var isPissed = false
var animFinish = false

func _ready():
	HP = 20
	pass
	
func damage():
	HP -= 1
	if HP == 0:
		dead()


func dead():
	isDead = true
	animFinish = false
	motion = Vector2(0,0)
	$CollisionShape2D.set("disabled", true)
	$AnimatedSprite.play("Die")
	emit_signal("killed")
	if animFinish == true:
		emit_signal("endgame")
	
func _physics_process(delta):
	if isDead == false:
			$AnimatedSprite.play("Gallop")
			motion.y += GRAVITY
			motion.x = SPEED * direction
		
			if direction == -1:
				$AnimatedSprite.flip_h = false
			else:
				$AnimatedSprite.flip_h = true	
			
			motion = move_and_slide(motion, UP)	
			
			if is_on_wall():
				direction *= -1
				$Sight.position.x *= -1	
			
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				emit_signal("kill_player")
		

func _on_Player__attacks():
	HP -= 1
	if HP == 0:
		dead()

func _on_Timer_timeout():
	isIdle = false
	
func _on_AttackTimer_timeout():
	isIdle = true

func _on_BoostTimer_timeout():
	isPissed = false




func _on_AnimatedSprite_animation_finished():
	animFinish = true
