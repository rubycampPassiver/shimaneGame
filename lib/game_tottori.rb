#coding: SJIS

class Game_tottori
def initialize
    @bg_img = Image.load("image/game.png")
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