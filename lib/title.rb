class Title
  def initialize
		if Input.mousePush?(P_BUTTON0) then
		x = Input.
		y = Input.M_LBUTTON
		end
	#オブジェクトの読み込み
    @bg =  Image.load(File.expand_path("../../image/title.png", __FILE__))
	@@img_start = Sprite.new(275,200, Image.load(File.expand_path("../../image/start.png", __FILE__)))
	@@img_end = Sprite.new(275,375, Image.load(File.expand_path("../../image/end.png", __FILE__)))
	@pt = Sprite.new(x,y, Image.load(File.expand_path("../../image/pt.png", __FILE__)))
  end

  def update
		if Input.mousePush?(P_BUTTON0) then
		x = Input.
		y = Input.M_LBUTTON
		end
	@pt.x = Input.mousePosX
	@pt.y = Input.mousePosY
  end

  def play

    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
	#オブジェクトの描画
	Window.draw(0,0,@bg)
	@@img_start.draw
	@@img_end.draw
	
	self.update
	@pt.draw
  end

end
