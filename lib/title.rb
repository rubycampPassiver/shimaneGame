class Title
  def initialize
    @bg =  Image.load(File.expand_path("../../image/title.png", __FILE__))
  end

  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
	#�I�u�W�F�N�g�̕`��
	Window.draw(0,0,@bg)

  end

end
