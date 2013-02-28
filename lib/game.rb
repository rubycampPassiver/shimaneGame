#<<<<<<< HEAD
#coding: SJIS
class Game

  CHUGOKU = 1
  WESTJP = 2
  ALLJP = 3

  def initialize(modeint)
    imgname = ''
    case modeint
	when CHUGOKU
	imgname = 'bg_chugoku.png'
	when WESTJP
	imgname = 'bg_westjp.png'
	when ALLJP
	imgname = 'bg_alljp.png'
   end
#=======
#?class Game_tottori
#   def initialize
#>>>>>>> 5f7a8ede8fed0f25689eed409cb31394fabbfab6
    @bg_img = Image.load("image/game_bg.png")
    @img_shimane = Image.load("image/shimane.png")
    @img_enemy = Image.load("image/"+imgname)
    @tiji   = Image.load("image/tiji.png")

  end

  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    Window.draw(0, 0, @bg_img)
    Window.draw(25,25, @img_shimane)
    Window.draw(450, 25, @img_enemy)
    Window.draw( 31,392,@tiji)
    Window.draw(255,392,@tiji)
    Window.draw(456,392,@tiji)
    Window.draw(680,392,@tiji)
  end
end