#coding: SJIS
class Mayor < Sprite
  
  #�f�t�H���g�R���X�g���N�^
  def initialize(x,y)
    super(x,y,Image.load(File.expand_path("../image/tiji.png", __FILE__)))
    @dx = 0
  end

  #�A�b�v�f�[�g����
  def update
    speed = 5
    @dx = Input.x*speed
    diff = 30
    if self.x < 0 + diff then @dx = speed
    elsif self.x > Window.width/2 - (self.image.width + diff) then @dx -= speed
    else @dx += Input.x * speed
    end
    self.x += @dx
  end
  
end
