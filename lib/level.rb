#coding: SJIS

class Level
  attr_accessor :pref 
  attr_accessor :dist 
  attr_accessor :alljp
  attr_reader :cursorbit
  
  def initialize
    
    downpx = 150
    Image.load(File.expand_path("../../image/title.png", __FILE__))#�w�i�摜
    @level_title = "�ΐ탌�x��"#�^�C�g����
    prefimg = Image.load(File.expand_path("../../image/pref_tottori.png", __FILE__))
    Sprite.new((Window.width-prefimg.width)/2-200,Window.height/2+downpx,prefimg)#���̃C���[�W
    distimg = Image.load(File.expand_path("../../image/dist_chugoku.png", __FILE__))
    Sprite.new((Window.width-distimg.width)/2,Window.height/2+downpx,distimg)#�n���̃C���[�W
    jpimg = Image.load(File.expand_path("../../image/all_japan.png", __FILE__))
    Sprite.new((Window.width-jpimg.width)/2+200,Window.height/2+downpx,jpimg)#�S���̃C���[�W
    Sprite.new(0,0,Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))#�[���N���b�N�̂��߂̏����ȃr�b�g�}�b�v
  end
  
  def play
    #���̉�ʂւ̑J��
    Scene.set_scene(:game_tottori) if Input.keyPush?(K_SPACE)
    
    Window.draw(0,0,@bg_img)
    @smbit.x = Input.mousePosX  # �}�E�X�J�[�\����x���W
    @smbit.y = Input.mousePosY  # �}�E�X�J�[�\����y���W#
    
    Sprite.draw(@smbit)#
    Sprite.draw(@pref)#
    Sprite.draw(@dist)#
    Sprite.draw(@alljp)#
    puts "hit pref!" if Sprite.check(@smbit,@pref) unless  @smbit.check([@pref]).empty?
    puts "hit dist!" if Sprite.check(@smbit,@dist) unless @smbit.check([@dist]).empty?
    puts "hit jp!" if Sprite.check(@smbit,@alljp) unless @smbit.check([@alljp ]).empty?
    
  end
end
