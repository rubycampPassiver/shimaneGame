class Title
  def initialize
		#���N���b�N���̂ݍ��W���擾
		if Input.mouseDown?(M_LBUTTON) then
      x = Input.mousePosX
      y = Input.mousePosY
		end
    #�I�u�W�F�N�g�̓ǂݍ���
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
    #<<<<<<< HEAD
    Scene.set_scene(:level) if Input.keyPush?(K_SPACE)
    Window.draw(0, 0, @bg_img)
    #=======

    #  Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    #�I�u�W�F�N�g�̕`��
    Window.draw(0,0,@bg)
    @@img_start.draw
    @@img_level.draw
    @@img_end.draw
	
    self.update
    @pt.draw
    #>>>>>>> 11fc0134d48e9698f439289feb429cc069107d90
  end

end
