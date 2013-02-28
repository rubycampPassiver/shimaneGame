require  'dxruby'

Window.width  = 800
Window.height = 600

back  = Image.load("images/game.png")
mayor = Image.load("images/tiji.png")
@dx = 0


Window.loop do
	Window.draw(0,0,back)
	Window.draw(135,392,mayor)
	Window.draw(565 + @dx,392,mayor)
	if @dx >= -125 && @dx <= 135 then
		@dx += Input.x * 2
	elsif @dx < -125 then
		@dx = @dx + 2
	elsif @dx > 135 then
		@dx = @dx - 2
	end
end
