# To change this template, choose Tools | Templates
# and open the template in the editor.

#�z�o�[���Ă鎞�ɉ�������̃C�x���g���s���悤�ȃ{�^��
class HoverButton < Sprite
  
  attr_reader :img
  
  #  �f�t�H���g�R���X�g���N�^
  def initialize(img)#�w�i�摜�������l�ɐݒ�
    self.img = img
  end
  
  #  �A�b�v�f�[�g����
  attr_reader :cursorbit 
  def update
    
    x = Input.mousePosX  # �}�E�X�J�[�\����x���W
    y = Input.mousePosY  # �}�E�X�J�[�\����y���W
    bitImg = Image.load("../image/")#�[���N���b�N�̂��߂̓����摜
    Window.load(x,y,bitImg)
    
    @hovering =  false #�z�o�����O����
    if self.x < bitimg.x and (bitimg.x<self.x + self.widt) and self.y <bitimg.y  and bitimg.y<(self.y + self.height) then
      @hovering =  true
    end
    
  end
  
  def hovering?
    return @hovering
  end

end
