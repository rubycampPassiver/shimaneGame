require 'dxruby'
player_img = Image.load("images/player.png")
x = 320
y = 240

Window.loop do
	break if Input.keyPush?(K_ESCAPE)

	x += Input.x
	y += Input.y

	Window.draw(x,y,player_img)

	player_x = Input.mousePosX
	player_y = Input.mousePosY

	Window.draw(player_x,player_y,player_img)

	Image.line(player_x,player_y,x,y[255,255,255,255])
end
