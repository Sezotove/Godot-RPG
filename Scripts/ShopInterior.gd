extends Node2D

export (PackedScene) var change_to_scene
export (Vector2) var move_to_position


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.player_position:
		get_node("Player2").global_position = Global.player_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ShopEntrance_body_entered(body):
	if change_to_scene and move_to_position:
		Global.player_position = move_to_position
		get_tree().change_scene_to(change_to_scene
