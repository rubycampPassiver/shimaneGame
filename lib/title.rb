class Title
  def initialize
		#左クリック時のみ座標を取得
		if Input.mouseDown?(M_LBUTTON) then
      x = Input.mousePosX
      y = Input.mousePosY
		end
    #オブジェクトの読み込み
    @bg =  Image.load(File.expand_path("../../image/title.png", __FILE__))
    @@img_start = Sprite.new(275,150, Image.load(File.expand_path("../../image/start.png", __FILE__)))
    @@img_level = Sprite.new(275,300, Image.load(File.expand_path("../../image/level.png", __FILE__)))
    @@img_end = Sprite.new(275,450, Image.load(File.expand_path("../../image/end.png", __FILE__)))
    @pt = Sprite.new(x,y, Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))
  end

  def update
		if Input.mouseDown?(M_LBUTTON) then
      @pt.x = Input.mousePosX
      @pt.y = Input.mousePosY
		end
  end

  def play
    Scene.set_scene(:level) if Input.keyPush?(K_SPACE)

    #オブジェクトの描画
    Window.draw(0, 0, @bg)
    @@img_start.draw
    @@img_level.draw
    @@img_end.draw
	
    self.update
    @pt.draw
  end

end
