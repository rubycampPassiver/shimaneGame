# To change this template, choose Tools | Templates
# and open the template in the editor.

class Camel < Item
  #�f�t�H���g�R���X�g���N�^
  def initialize(x,y)
    super(x,y,Image.load(File.expand_path("../../image/fall_item/nashi.png", __FILE__)))
    @point = 20
#		@x_speed = 1.0
#		@x_direction = 1.0
  end

  #�o�j�b�V��
  def vanished?
    @vanished
  end
end
