tool
extends TextureButton

export(String) var text = "Text button" # The text displayed on screen
export(int) var arrow_margin_from_center = 200 # The margin space from the middle of the button for arrows

func _ready():
	setup_text()
	hide_arrows()
	set_focus_mode(true) # Sets the focus for keyboard

func _process(delta):
	
	# Sets the arrow margin manually at the inspector node
	if Engine.editor_hint:
		setup_text()
		show_arrows()

# Sets the text and the bbcode
func setup_text():
	$RichTextLabel.bbcode_text = "[center] %s [/center]" % [text]

# Function to show the arrows on screen
func show_arrows():
	
	# Sets visibility and the space alloced for them
	for arrow in [$LeftArrow, $RightArrow]:
		arrow.visible = true
		arrow.global_position.y = rect_global_position.y + (rect_size.y / 3.0)
	
	# Sets the distance from center
	var center_x = rect_global_position.x + (rect_size.x / 2)
	$LeftArrow.global_position.x = center_x - arrow_margin_from_center
	$RightArrow.global_position.x = center_x + arrow_margin_from_center

# Function to hide the arrows on screen
func hide_arrows():
	for arrow in [$LeftArrow, $RightArrow]:
		arrow.visible = false

# Function that will show the arrows when button is focused
func _on_TextureButton_focus_entered():
	show_arrows()

# Function that will hide the arrows when button isn't focused anymore
func _on_TextureButton_focus_exited():
	hide_arrows()

func _on_TextureButton_mouse_entered():
	grab_focus()
	pass # Replace with function body.
