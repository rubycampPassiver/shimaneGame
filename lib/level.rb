class Level
  def initialize
    #背景画像
    @bg_img = Image.load("image/title.png")
    #タイトル文
    @title = "対戦レベル"
    
  end

  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    
    Window.draw(0, 0, @bg_img)
  end
end
