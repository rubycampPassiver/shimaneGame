# To change this template, choose Tools | Templates
# and open the template in the editor.

class Crab < Item
  
  #�f�t�H���g�R���X�g���N�^
  def initialize(x,y)
    img = Image.load(File.expand_path("../../image/crab.png", __FILE__))
    img.setColorKey([255,255,255])
    super(x,y,img)
    @point = 50
#    @x_speed = 1
#    @x_direction = 1
  end
  
  #�o�j�b�V��
  def vanished?
    @vanished
  end
  
end
