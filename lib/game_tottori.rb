#coding: SJIS

class Game_tottori
def initialize

		if Input.mouseDown?(M_LBUTTON) then
		x = Input.mousePosX
		y = Input.mousePosY
		end

	@a = 0
    @bg_img = Image.load("image/game.png")
	@start = Image.load("image/kaishi.png")
    @citizen   = Image.load("image/citizen.png")
		@item_img = Image.load("./image/tiji.png")
		@item_img2 = Image.load("./image/win.png")
		@item_img3 = Image.load("./image/lose.png")
		@items1 = []
		@items2 = []

		#スプライトクラスのオブジェクトを設定（ボタン、擬似クリック用ポインタ）
    @img_next = Sprite.new(275,250, Image.load(File.expand_path("../../image/next.png", __FILE__)))
	@img_end = Sprite.new(275,450, Image.load(File.expand_path("../../image/end.png", __FILE__)))
	@img_title = Sprite.new(275,350, Image.load(File.expand_path("../../image/img_title.png", __FILE__)))
    @pt = Sprite.new(x,y, Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))
  end

  #擬似ポインタをクリック先に移動
    def update(a)
		@pt.x = Input.mousePosX
		@pt.y = Input.mousePosY

		if a == 1
		@img_next.draw
		@img_end.draw
		@img_title.draw
		end
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

      Scene.set_scene(:title) if Input.keyPush?(K_SPACE)


#START画像の表示
Window.draw(0,0,@start)
		Sprite.update(@items1)
		Sprite.update(@items2)
      Window.draw(0, 0, @bg_img)
		Window.draw( 75,459,@citizen)
		Window.draw(255,459,@citizen)
		Window.draw(475,459,@citizen)
		Window.draw(680,459,@citizen)
		Sprite.draw(@items1)
		Sprite.draw(@items2)
		add_item
		Sprite.clean(@items1)
		Sprite.clean(@items2)
#Yが押されたとき@a＝１とする
if Input.keyDown?(K_Y)
	@a = 1
end


#コンティニューとENDボタン、擬似ポインタの表示
	self.update(@a)
    @pt.draw
	


    #ボタン処理（次の画面への遷移）
 	if Input.mouseDown?(M_LBUTTON) then
      Scene.set_scene(:osaka) unless @pt.check([@img_next]).empty?
	  Scene.finish unless @pt.check(@img_end).empty?
	  Scene.set_scene(:title) unless @pt.check([@img_title]).empty?
    end

  end
end