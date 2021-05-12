extends KinematicBody2D

const UP = Vector2(0,-1)
var motion = Vector2()
var jumpCount = 0
var friction = false
var isAttack = false
var attackCount = 1
var isDead = false
var respawn = get("position")
var health = 8
signal _health_change()
signal _is_dead()
signal _death_time()
signal _attacks()
signal _standby()
signal _announce()
signal _complain()

#kinda a two dimensional array, acees x by var.x, acces y by var.y


#Adjusters
const MAX_SPEED = 200
const BOOST = 100
const JUMP = 275
const GRAVITY = 10
const ACCELERATION = 50

func _ready():
	health = 8
	pass

func _physics_process(delta):
	motion.y += GRAVITY

	if Input.is_action_just_pressed("action1") && isAttack == false:
		$Swing.playing = true
		isAttack = true
		$Sprite.play("Attack2")

	if isAttack == false:			
		if Input.is_action_pressed("ui_right") && Input.is_action_pressed("action2"):
			motion.x = min(motion.x + ACCELERATION, MAX_SPEED + BOOST)
			$Sprite.flip_h = false
			$Sprite.play("Sprint")
			$Run.playing = true
		elif Input.is_action_pressed("ui_left") && Input.is_action_pressed("action2"):
			motion.x = max(motion.x - ACCELERATION, -MAX_SPEED - BOOST)
			$Sprite.flip_h = true
			$Sprite.play("Sprint")
			$Run.playing = true
		elif Input.is_action_pressed("ui_right"): 
			motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
			$Sprite.flip_h = false
			$Sprite.play("Run")
			$Run.playing = true
		elif Input.is_action_pressed("ui_left") :
			motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
			$Sprite.flip_h = true
			$Sprite.play("Run")
			$Run.playing = true
		else :
			$Sprite.play("Idle")
			friction = true	
			$Run.playing = false
		
	if isAttack == false:	
		if is_on_floor():
			jumpCount = 0
			if Input.is_action_just_pressed("ui_select"):
				$Jump.playing = true
				jumpCount += 1
				motion.y = -JUMP
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)	
		else:
			if motion.y < 0:
				$Sprite.play("Jump")
			else:
				$Sprite.play("Fall")
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.05)	
			if jumpCount < 2:
				if Input.is_action_just_pressed("ui_select"):
					$Jump.playing = true
					jumpCount += 1
					motion.y = -JUMP
			
		
			
	
	motion = move_and_slide(motion, UP)
	
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Enemy" in get_slide_collision(i).collider.name:
				dead()

func _on_Sprite_animation_finished():
	isAttack = false
	emit_signal("_standby")
	
func dead():
	$Hit.playing = true
	health -= 1
	emit_signal("_health_change")
	set("position", respawn)
	if health == 0:
		emit_signal("_is_dead")
		queue_free()

func _on_Killzone_body_entered(body):
	$Hit.playing = true
	health -= 1
	emit_signal("_health_change")
	set("position", respawn)
	if health == 0:
		emit_signal("_is_dead")
		queue_free()
	pass # replace with function body


func _on_Death_body_entered(body):
	$Hit.playing = true
	health -= 1
	emit_signal("_health_change")
	set("position", respawn)
	if health == 0:
		emit_signal("_is_dead")
		queue_free()
	pass # replace with function body


func _on_CheckPoint_body_entered(body):
	$CP.playing = true
	respawn = get("position")
	pass # replace with function body

func _on_AttackZone_body_entered(body):
	if isAttack == true:
		$Hit.playing = true
		if "Enemy" in body.name:
			emit_signal("_attacks")
			body.dead()
		elif "Boss" in body.name:
			body.damage()
	pass # replace with function body


func _on_Goal_remind():
	emit_signal("_announce")
	pass # replace with function body


func _on_goal_remind():
	emit_signal("_announce")
	pass # replace with function body


func _on_CheckPoint2_body_entered(body):
	$CP.playing = true
	respawn = get("position")
	pass # replace with function body


func _on_BossGate_to_boss():
	set("position", Vector2(3565, 270))
	emit_signal("_complain")
	pass # replace with function body


func _on_Enemies_kill_player():
	dead()
	pass # replace with function body


func _on_Boss_kill_player():
	dead()
	pass # replace with function body
