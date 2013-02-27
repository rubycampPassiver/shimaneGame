#coding: SJIS

class Game_tottori
  def initialize

	@bg_img =Image.load(File.expand_path("../../image/game_bg.png", __FILE__))
	@img_shimane = Image.load(File.expand_path("../../image/shimane.png", __FILE__))
	@img_tottori =Image.load(File.expand_path("../../image/tottori.png", __FILE__))
	@tiji   =Image.load(File.expand_path("../../image/tiji.png", __FILE__))
  end

  def play
    #Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    Window.draw(0, 0, @bg_img)
	Window.draw(25,25, @img_shimane)
    Window.draw(450, 25, @img_tottori)
	Window.draw( 31,392,@tiji)
	Window.draw(255,392,@tiji)
	Window.draw(456,392,@tiji)
	Window.draw(680,392,@tiji)
  end
end