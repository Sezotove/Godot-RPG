extends Area2D

export(String, FILE, "*.tscn") var world_exit
export (Vector2) var spawn_pos

func _process(delta):
	var areas = get_overlapping_areas()
	for area in areas:
		if area.name == "Player":
			get_tree().change_scene(world_exit)
			Global.player_pos = spawn_pos

func _on_Entrance_body_entered(body):
	if world_exit:
		get_node("/root/Global").player_pos = spawn_pos
