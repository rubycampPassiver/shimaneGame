class Level
  def initialize
    #�w�i�摜
    @bg_img = Image.load("image/title.png")
    #�^�C�g����
    @title = "�ΐ탌�x��"
    
  end

  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    
    Window.draw(0, 0, @bg_img)
  end
end
