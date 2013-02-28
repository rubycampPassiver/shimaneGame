#coding: SJIS
class Mayor < Sprite
  
  def initialize(x=135,y=392)
    puts "できた"
    super(x,y,Image.load(File.expand_path("../image/tiji.png", __FILE__)))
    @dx = 0
  end

  def update
    speed = 5
    @dx = Input.x*speed
    if self.x < 0 then @dx = speed
    elsif self.x > Window.width/2 - self.image.width then @dx -= speed
    else @dx += Input.x * speed
    end
    self.x += @dx
  end
  
end
