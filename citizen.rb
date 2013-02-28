require 'dxruby'

Window.width  = 800
Window.height = 600


gamemap = Image.load("image/game.png")
tiji    = Image.load("image/citizen.png")

Window.loop do
	Window.draw(  0,  0,gamemap)
	Window.draw( 31,392,citizen)
	Window.draw(255,392,citizen)
	Window.draw(456,392,citizen)
	Window.draw(680,392,citizen)
end
