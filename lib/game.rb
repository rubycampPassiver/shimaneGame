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
    @bg_img = Image.load("image/game_bg.png")
	@start = Image.load("image/kaishi.png")
    @img_shimane = Image.load("image/shimane.png")
    @img_enemy = Image.load("image/"+imgname)
    @tiji   = Image.load("image/tiji.png")
	@item_img = Image.load("./image/fall_item/kani.png").setColorKey([0, 255, 0])
	@item_img2 = Image.load("./image/fall_item/yamata.png").setColorKey([0, 255, 0]) # i_okane.png, i_shijimi.pngを追加したい.
	@item_img3 = Image.load("./image/fall_item/rakuda.png").setColorKey([0, 255, 0])
    @citizen   = Image.load("image/citizen.png")
	@items1 = []
	@items2 = []

	if Input.mouseDown?(M_LBUTTON) then
		x = Input.mousePosX
		y = Input.mousePosY
	end
	@a = 0
	@start_x = 800
	@start_y = 0

	#スプライトクラスのオブジェクトを設定（ボタン、擬似クリック用ポインタ）
    @img_next = Sprite.new(275,250, Image.load(File.expand_path("../../image/next.png", __FILE__)))
	@img_end = Sprite.new(275,450, Image.load(File.expand_path("../../image/end.png", __FILE__)))
	@img_title = Sprite.new(275,350, Image.load(File.expand_path("../../image/img_title.png", __FILE__)))
    @pt = Sprite.new(x,y, Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))
  end

  def add_item
    item_array_size = 12
    
    if (@items1.size <= item_array_size) and (0 < (rand(100.0)+1.0).abs and (rand(100.0)+1.0).abs < 1.5)
      x_origin, y_origin = 0+30+ rand(200),15
      case rand(4)
      when 3 then tmp = Crab.new(x_origin,y_origin)
      when 2 then tmp = Camel.new(x_origin,y_origin)
      else tmp = Orochi.new(x_origin,y_origin)
      end
      @items1 << tmp
    end	
    
    if (@items2.size <= item_array_size) and (0 < (rand(100.0)+1.0).abs and (rand(100.0)+1.0).abs < 1.5)
      x_origin, y_origin = Window.width/2+30+rand(200)-150,15
      case rand(4)
      when 3 then @items2 << Crab.new(x_origin, y_origin)
      when 2 then @items2 << Camel.new(x_origin, y_origin)
      else @items2 << Orochi.new(x_origin, y_origin)
      end	
    end	
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
	
	if @start_x > -800 then
	@start_x = @start_x -20
	end
  end

  
  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    Sprite.update(@items1)
    Sprite.update(@items2)
    Window.draw(0, 0, @bg_img)
    Window.draw(25,25, @img_shimane)
    Window.draw(450, 25, @img_enemy)
    Window.draw( 31,456,@citizen)
    Window.draw(255,456,@citizen)
    Window.draw(456,456,@citizen)
    Window.draw(680,456,@citizen)
    
	Window.draw(@start_x,@start_y,@start)

    Sprite.draw(@items1)	
    Sprite.draw(@items2)
    self.add_item
    Sprite.clean(@items1)
    Sprite.clean(@items2)


    if Input.keyDown?(K_Y)
	  @a = 1
    end


    #コンティニューとENDボタン、擬似ポインタの表示
	self.update(@a)
    @pt.draw
	Window.draw(@start_x,@start_y,@start)

    #ボタン処理（次の画面への遷移）
 	if Input.mouseDown?(M_LBUTTON) then
      Scene.set_scene(:game) unless @pt.check([@img_next]).empty?
	  Scene.finish unless @pt.check(@img_end).empty?
	  Scene.set_scene(:title) unless @pt.check([@img_title]).empty?
    end

  end
end