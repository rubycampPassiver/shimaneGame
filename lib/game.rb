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
    @item_img = Image.load("./image/tiji.png")
		@item_img2 = Image.load("./image/win.png")
		@item_img3 = Image.load("./image/lose.png")
		@items1 = []
		@items2 = []

  end

  def add_item
	if @items1.size <= 12
	    if rand(150) == 2
		ransuu = rand(4)
		case ransuu
			when 3
				@items1 << Item.new(rand(200)+30,15,@item_img3)
			when 2
				@items1 << Item.new(rand(200)+30,15,@item_img2)
			else
				@items1 << Item.new(rand(200)+30,15,@item_img)
		end
	     end
	 end	
	 if @items2.size <= 12
             if rand(150) == 2
		ransuu = rand(4)
	        case ransuu
			when 3
				@items2 << Item.new(Window.width-rand(200)-150,25,@item_img3)
			when 2
				@items2 << Item.new(Window.width-rand(200)-150,25,@item_img2)
			else
				@items2 << Item.new(Window.width-rand(200)-150,25,@item_img)
		end	
	     end
	 end	
  end
  
  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    Sprite.update(@items1)
    Sprite.update(@items2)
   
    Window.draw(0, 0, @bg_img)
    Window.draw(25,25, @img_shimane)
    Window.draw(450, 25, @img_enemy)
    Window.draw( 31,392,@tiji)
    Window.draw(255,392,@tiji)
    Window.draw(456,392,@tiji)
    Window.draw(680,392,@tiji)
    
    Sprite.draw(@items1)	
    Sprite.draw(@items2)
    add_item
    Sprite.clean(@items1)
    Sprite.clean(@items2)
  end
end