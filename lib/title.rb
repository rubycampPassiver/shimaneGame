class Title
  def initialize
    
	Sprite.new( x=225, y=175, image="../../image/title.png ")
	@image2 = Image.load(File.expand_path("../../image/end.png", __FILE__))
  end

  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    
	Window.draw(0, 0, @bg_img)
	


	Window.draw(225,200,@image2)
  end


end