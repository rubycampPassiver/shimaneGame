class Title
  def initialize
    @bg =  Image.load(File.expand_path("../../image/title.png", __FILE__))
	@@img_start = Sprite.new(200,175, Image.load(File.expand_path("../../image/start.png", __FILE__)))
	@@img_end = Sprite.new(200,375, Image.load(File.expand_path("../../image/end.png", __FILE__)))
  end

  def play

    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
	#オブジェクトの描画
	Window.draw(0,0,@bg)
	@@img_start.draw
	@@img_end.draw
  end

end
