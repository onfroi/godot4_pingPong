extends Node2D

var player_points = 0
var enemy_points = 0

@onready var enemy_paddle = $EnemyPaddle
@onready var player_paddle = $Paddle
@onready var ball = $Ball as Ball
@onready var ui = $UI as UI

func _on_enemy_scored():
	enemy_points += 1
	ui.update_enemy_points(enemy_points)
	enemy_paddle.paddle_speed = enemy_paddle.paddle_speed / 2
	print_debug(enemy_points)
	reset_game()

func _on_player_scored():
	player_points += 1
	ui.update_player_points(player_points)
	enemy_paddle.paddle_speed = enemy_paddle.paddle_speed * 2
	print_debug(player_points)
	reset_game()

func reset_game():
	enemy_paddle.global_position.y = 0
	player_paddle.global_position.y = 0
	ball.global_position = Vector2.ZERO
	ball.velocity = Vector2.ZERO
	enemy_paddle.linear_velocity = Vector2.ZERO
	player_paddle.linear_velocity = Vector2.ZERO
	ball.start_ball()
