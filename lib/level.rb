#coding: SJIS

class Level
  attr_accessor :pref 
  attr_accessor :dist 
  attr_accessor :alljp
  attr_reader :cursorbit 
  def initialize
    #背景画像
    @bg_img = Image.load("image/title.png")
    
    #タイトル文
    @level_title = "対戦レベル"
    
    #県のイメージ
    @pref = Image.load("image/pref_tottori.png")
    #地方のイメージ
    @dist = Image.load("image/dist_chugoku.png")
    #全国のイメージ
    @alljp = Image.load("image/all_japan.png")
    
    #
    
    @pref = new HoverButton
  end

  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    
    Window.draw(550, 400, @alljp)
  end
end
