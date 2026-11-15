extends CharacterBody2D

@export var speed: float = 630.0
@export var jump_velocity: float = -720.0
@export var jump_cut : float = 0.3

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

var jumps : int = 1
var was_on_floor : bool = true
var check_pointPOS: Vector2 = Vector2.ZERO
var deaths : int = 0

# the level displays the number of deathes
# if we get enough time we can make a ranking system

func _ready():
	pass

func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	elif velocity.y >= 0:
		jumps = max(jumps , 1)

	# Jump
	if Input.is_action_just_pressed("jump") and jumps > 0:
		$sfx/jump.play(0.25)
		velocity.y = jump_velocity
		jumps -= 1
	# this makes you cut your jump if you let go of the button early
	# the jump cut var is currently 0.2 and it is an export so you can edit it
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= jump_cut

	# Horizontal movement
	var direction = Input.get_axis("left", "right")

	if direction != 0:
		velocity.x = direction * speed
		animated_sprite.flip_h = direction < 0
		if not $sfx/walk.playing:
			$sfx/walk.play(0.30)

		elif $sfx/walk.playing and not is_on_floor():
			$sfx/walk.stop()

	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		$sfx/walk.stop()
		
	# Animations
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
	elif direction != 0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
		
	move_and_slide()
	
	if is_on_floor() and not was_on_floor:
		jumps = max(jumps , 0)
		was_on_floor = is_on_floor()
	# was on floor is a bool variable , just made to fix a bug 

func death_func():
	deaths += 1
	velocity = Vector2.ZERO
	#await get_tree().create_timer(0.5).timeout
	global_position = check_pointPOS
	
