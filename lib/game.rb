class Game

  CHUGOKU = 1
  WESTJP = 2
  ALLJP = 3

  def initialize(modeint)
    imgname = ''
    case modeint
    when CHUGOKU
      imgname = 'bg_chugoku.png'
    when WESTJP
      imgname = 'bg_westjp.png'
    when ALLJP
      imgname = 'bg_alljp.png'
    end
    @bg_img = Image.load("image/game_bg.png")
    @img_shimane = Image.load("image/shimane.png")
    @img_enemy = Image.load("image/"+imgname)
    @tiji   = Image.load("image/tiji.png")
		@items1 = []#左上に出てくるアイテム群
		@items2 = []#右上に出てくるアイテム群

  end

  def add_item
    item_array_size = 12
    
    if (@items1.size <= item_array_size) and (0 < (rand(100.0)+1.0).abs and (rand(100.0)+1.0).abs < 1.5)
      x_origin, y_origin = 0+30+ rand(200),15
      case rand(4)
      when 3 then tmp = Crab.new(x_origin,y_origin)
      when 2 then tmp = Camel.new(x_origin,y_origin)
      else tmp = Orochi.new(x_origin,y_origin)
      end
      @items1 << tmp
    end	
    
    if (@items2.size <= item_array_size) and (0 < (rand(100.0)+1.0).abs and (rand(100.0)+1.0).abs < 1.5)
      x_origin, y_origin = Window.width/2+30+rand(200)-150,15
      case rand(4)
      when 3 then @items2 << Crab.new(x_origin, y_origin)
      when 2 then @items2 << Camel.new(x_origin, y_origin)
      else @items2 << Orochi.new(x_origin, y_origin)
      end	
    end	
  end	
  
  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    Sprite.update(@items1)
    Sprite.update(@items2)
   
    Window.draw(0, 0, @bg_img)
    Window.draw(25,25, @img_shimane)
    Window.draw(450, 25, @img_enemy)
    Window.draw( 31,392,@tiji)
    Window.draw(255,392,@tiji)
    Window.draw(456,392,@tiji)
    Window.draw(680,392,@tiji)
    
    Sprite.draw(@items1)	
    Sprite.draw(@items2)
    self.add_item
    Sprite.clean(@items1)
    Sprite.clean(@items2)
  end
end