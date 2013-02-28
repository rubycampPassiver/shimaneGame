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
    prefimg = Image.load(File.expand_path("../../image/btn_chugoku.png", __FILE__))
    @chugoku=Sprite.new((Window.width-prefimg.width)/2-200,Window.height/2+downpx,prefimg)#���̃C���[�W
    distimg = Image.load(File.expand_path("../../image/btn_westjp.png", __FILE__))
    @westjp=Sprite.new((Window.width-distimg.width)/2,Window.height/2+downpx,distimg)#�n���̃C���[�W
    jpimg = Image.load(File.expand_path("../../image/btn_alljp .png", __FILE__))
    @alljp=Sprite.new((Window.width-jpimg.width)/2+200,Window.height/2+downpx,jpimg)#�S���̃C���[�W
    back = Image.load(File.expand_path("../../image/back.png", __FILE__))
    @back=Sprite.new(Window.width-back.width,Window.height-back.height,back)#�߂�{�^��
    @back.scale_x = 0.5#�X�P�[������(��)
    @back.scale_y = 0.5#�X�P�[������(����)
    @pt=Sprite.new(0,0,Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))#�[���N���b�N�̂��߂̏����ȃr�b�g�}�b�v
    
  end
  
  def play
    Scene.set_scene(:title) if Input.keyPush?(K_SPACE)#�I������
    Window.draw(0,0,@bg_img)#�o�b�N�O���E���h�Z�b�g
    click = Input.mouseDown?(M_LBUTTON) ? true : false    
    
    #�[���I�u�W�F�N�g�̃Z�b�g
    @pt.x = Input.mousePosX  # �}�E�X�J�[�\����x���W
    @pt.y = Input.mousePosY  # �}�E�X�J�[�\����y���W#
    
    #�e�X�v���C�g�̕`��
    Sprite.draw(@pt)#
    Sprite.draw(@chugoku)#
    Sprite.draw(@westjp)#
    Sprite.draw(@alljp)#
    Sprite.draw(@back)#
    
    #�{�^�������i���̉�ʂւ̑J�ځj
    if click then 
      Scene.set_scene(:chugoku) unless @pt.check([@chugoku]).empty?
      Scene.set_scene(:westjp) unless @pt.check([@westjp]).empty?
      Scene.set_scene(:alljp) unless @pt.check([@alljp]).empty?
      Scene.set_scene(:title) unless @pt.check([@back]).empty?
    end
  end
end
