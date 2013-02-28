# To change this template, choose Tools | Templates
# and open the template in the editor.

class Bullet < Sprite
  
  attr_accessor :img_base_x
  attr_accessor :img_base_y
  attr_accessor :base_x
  attr_accessor :base_y
  attr_accessor :base_r
  
  attr_accessor :bd_up
  attr_accessor :bd_down
  attr_accessor :bd_left
  attr_accessor :bd_right
  
  #�f�t�H���g�R���X�g���N�^
  def initialize(x = 0.0, y = 0.0, up = 0.0, down = 100.0, left =  0.0, right = 100.0, ai)
    
    #�\���J�n�n�_
    @img_base_x, @img_base_y= x, y
    
    #�T�C�Y�i�c�A���A���a�j
    size = 20 #�匳�̃T�C�Y
    @base_x, @base_y, @base_r = size/2, size/2, size/2
    super(@img_base_x,@img_base_y, Image.new(@img_base_x,@img_base_y).circleFill(@base_x, @base_y, @base_r, [0,0,0]))
    
    #�ʂ̗L���͈͂̋��E����ۑ�
    @bd_up, @bd_down, @bd_left,@bd_right = up, down, left, right
    
    #�}�E�X���W�̕ۑ�
    if not ai then
      @mouse_x, @mouse_y = Input.mousePosX, Input.mousePosY
    else
      @mouse_x, @mouse_y = rand(right - left) + left, rand(down - up) + up
    end
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
    #    @vanished = true if has_out

  end
  
  # �A�C�e���ɓ��������ꍇ
  def shot(obj)
    (@vanished = true if not obj.falling)if obj.is_a?(Item)
  end
    
  
  #�ʂ���ʊO�i+-100px�j�ɏo�����ǂ����̔���
  def has_out
    
    flag = false
    #    flag = true if ((self.x<@bd_left) || (@bd_right<self.x+self.image.width))
    #    flag = true if ((self.y<@bd_up)||(@bd_down<self.y+self.image.height))
    
    return flag
  end
  
  #�ʂ���ʊO�i+-100px�j�ɏo�����ǂ����̒l
  def vanished?
    return @vanished
  end
  
end
