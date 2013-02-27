require 'dxruby'

Window.width  = 800
Window.height = 600


gamemap = Image.load("image/game.png")
tiji    = Image.load("image/tiji.png")

Window.loop do
	Window.draw(  0,  0,gamemap)
	Window.draw( 31,392,tiji)
	Window.draw(255,392,tiji)
	Window.draw(456,392,tiji)
	Window.draw(680,392,tiji)
end
