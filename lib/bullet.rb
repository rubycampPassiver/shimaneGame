# To change this template, choose Tools | Templates
# and open the template in the editor.

class Bullet < Sprite
  
  attr_accessor :img_base_x
  attr_accessor :img_base_y
  attr_accessor :base_x
  attr_accessor :base_y
  attr_accessor :base_r
  attr_accessor :bt
  
  #�f�t�H���g�R���X�g���N�^
  def initialize(x, y)
    
    #�\���J�n�n�_
    @img_base_x = x
    @img_base_y = y
    
    #�T�C�Y�i�c�A���A���a�j
    size = 50
    @base_x = size/2
    @base_y = size/2
    @base_r = size/2
    super(@img_base_x,@img_base_y, Image.new(@img_base_x,@img_base_y).circleFill(@base_x, @base_y, @base_r, [0,0,0]))
    
    #�}�E�X���W�̕ۑ�
    @mouse_x = Input.mousePosX
    @mouse_y = Input.mousePosY
    
  end
  
  #�A�b�v�f�[�g
  def update
    
    #�ʂ̃X�s�[�h
    speed_x = 20
    speed_y = 20
    
    #�ʂ̈ʒu�X�V
    hyp = Math.hypot((@mouse_x-@img_base_x), (@mouse_y-@img_base_y))
    self.x +=speed_x*((@mouse_x-@img_base_x)/hyp)
    self.y +=speed_y*((@mouse_y-@img_base_y)/hyp)
    #�{���͉�ʊO�ɏo��������������A��������Ə��߂�������Ă��܂�
    #    self.vanish if has_out?
    
  end
  
  #�ʂ���ʊO�i+-100px�j�ɏo�����ǂ����̔���
  def has_out?
    flag = false
    flag = true if self.x < 0 -100 || Window.width < self.x+100
    flag = true if self.y < 0-100 || Window.height < self.y+100
    return flag
  end
  
  #�ʂ���ʊO�i+-100px�j�ɏo�����ǂ����̒l
  def vanished?
    return @vanished
  end
  
end
