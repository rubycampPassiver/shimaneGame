# To change this template, choose Tools | Templates
# and open the template in the editor.

class Pear < Item
  
  #�f�t�H���g�R���X�g���N�^
  def initialize(x,y)
    img = Image.load(File.expand_path("../../image/pear.png", __FILE__))
    img.setColorKey([255,255,255])
    super(x,y,img)
    @point = 10
		@x_speed = 1.0
		@x_direction = 1.0
  end
  
  #�o�j�b�V��
  def vanished?
    @vanished
  end
  
end