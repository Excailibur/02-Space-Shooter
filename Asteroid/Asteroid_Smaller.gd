extends KinematicBody2D

var velocity = Vector2.ZERO
var initial_speed = 3.0
var health = 1

func _ready():
	velocity = Vector2(0,initial_speed*randf()).rotated(PI*2*randf())

func _physics_process(_delta):
	position = position + velocity
	position.x = wrapf(position.x, 0, Global.VP.x)
	position.y = wrapf(position.y, 0, Global.VP.y)


func damage(d):
	health -= d
	if health <= 0:
		Global.update_score(300)
		queue_free()

