#coding: SJIS

class Level
  attr_accessor :pref 
  attr_accessor :dist 
  attr_accessor :alljp
  attr_reader :cursorbit
  
  def initialize
    
    downpx = 150
    @bg_img=Image.load(File.expand_path("../../image/title.png", __FILE__))#�w�i�摜
    @level_title = "�ΐ탌�x��"#�^�C�g����
    prefimg = Image.load(File.expand_path("../../image/pref_tottori.png", __FILE__))
    @pref=Sprite.new((Window.width-prefimg.width)/2-200,Window.height/2+downpx,prefimg)#���̃C���[�W
    distimg = Image.load(File.expand_path("../../image/dist_chugoku.png", __FILE__))
    @dist=Sprite.new((Window.width-distimg.width)/2,Window.height/2+downpx,distimg)#�n���̃C���[�W
    jpimg = Image.load(File.expand_path("../../image/all_japan.png", __FILE__))
    @alljp=Sprite.new((Window.width-jpimg.width)/2+200,Window.height/2+downpx,jpimg)#�S���̃C���[�W
    @pt=Sprite.new(0,0,Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))#�[���N���b�N�̂��߂̏����ȃr�b�g�}�b�v
  end
  
  def play
    
    Scene.set_scene(:Game_tottori) if Input.keyPush?(K_SPACE)#�I������
    Window.draw(0,0,@bg_img)#�o�b�N�O���E���h�Z�b�g
    click = Input.mouseDown?(M_LBUTTON) ? true : false    
    
    #�[���I�u�W�F�N�g�̃Z�b�g
    @pt.x = Input.mousePosX  # �}�E�X�J�[�\����x���W
    @pt.y = Input.mousePosY  # �}�E�X�J�[�\����y���W#
    
    #�e�X�v���C�g�̕`��
    Sprite.draw(@pt)#
    Sprite.draw(@pref)#
    Sprite.draw(@dist)#
    Sprite.draw(@alljp)#
    
    #�{�^�������i���̉�ʂւ̑J�ځj
    if click then 
      Scene.set_scene(:game_tottori) unless @pt.check([@pref]).empty?
      Scene.set_scene(:game_osaka) unless @pt.check([@dist]).empty?
      Scene.set_scene(:game_tokyo) unless @pt.check([@alljp ]).empty?
    end
    #    puts "hit pref!" if Sprite.check(@pt,@pref) unless  @smbit.check([@pref]).empty?
    #    puts "hit dist!" if Sprite.check(@pt,@dist) unless @smbit.check([@dist]).empty?
    #    puts "hit jp!" if Sprite.check(@pt,@alljp) unless @smbit.check([@alljp ]).empty?
    
  end
end
