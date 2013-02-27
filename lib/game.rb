class Game
  def initialize
    @bg_img = Image.load("image/game.png")
  end

  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    Window.draw(0, 0, @bg_img)
  end
end
