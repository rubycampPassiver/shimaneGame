#coding: SJIS

class Level
  attr_accessor :pref 
  attr_accessor :dist 
  attr_accessor :alljp
  attr_reader :cursorbit 
  def initialize
    #�w�i�摜
    @bg_img = Image.load("image/title.png")
    
    #�^�C�g����
    @level_title = "�ΐ탌�x��"
    
    #���̃C���[�W
    @pref = Image.load("image/pref_tottori.png")
    #�n���̃C���[�W
    @dist = Image.load("image/dist_chugoku.png")
    #�S���̃C���[�W
    @alljp = Image.load("image/all_japan.png")
    
    #
    
    @pref = new HoverButton
  end

  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    
    Window.draw(550, 400, @alljp)
  end
end
