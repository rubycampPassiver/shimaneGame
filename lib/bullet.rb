# To change this template, choose Tools | Templates
# and open the template in the editor.

class Bullet < Sprite
  
  attr_accessor :img_base_x
  attr_accessor :img_base_y
  attr_accessor :base_x
  attr_accessor :base_y
  attr_accessor :base_r
  attr_accessor :bt
  
  #デフォルトコンストラクタ
  def initialize(x, y)
    
    #表示開始地点
    @img_base_x = x
    @img_base_y = y
    
    #サイズ（縦、横、直径）
    size = 50
    @base_x = size/2
    @base_y = size/2
    @base_r = size/2
    super(@img_base_x,@img_base_y, Image.new(@img_base_x,@img_base_y).circleFill(@base_x, @base_y, @base_r, [0,0,0]))
    
    #マウス座標の保存
    @mouse_x = Input.mousePosX
    @mouse_y = Input.mousePosY
    
  end
  
  #アップデート
  def update
    
    #玉のスピード
    speed_x = 20
    speed_y = 20
    
    #玉の位置更新
    hyp = Math.hypot((@mouse_x-@img_base_x), (@mouse_y-@img_base_y))
    self.x +=speed_x*((@mouse_x-@img_base_x)/hyp)
    self.y +=speed_y*((@mouse_y-@img_base_y)/hyp)
    #本当は画面外に出たら消したいが、これをやると初めから消えてしまう
    #    self.vanish if has_out?
    
  end
  
  #玉が画面外（+-100px）に出たかどうかの判定
  def has_out?
    flag = false
    flag = true if self.x < 0 -100 || Window.width < self.x+100
    flag = true if self.y < 0-100 || Window.height < self.y+100
    return flag
  end
  
  #玉が画面外（+-100px）に出たかどうかの値
  def vanished?
    return @vanished
  end
  
end
