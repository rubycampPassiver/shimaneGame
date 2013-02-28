#coding: SJIS

class Game

  CHUGOKU = 1
  WESTJP = 2
  ALLJP = 3
  
  #�f�t�H���g�R���X�g���N�^
  def initialize(modeint)
    
    #�e���[�h�ɍ��킹�Ĕw�i��ύX
    imgname = nil
    case modeint
    when CHUGOKU then imgname = 'bg_chugoku.png'
    when WESTJP then imgname = 'bg_westjp.png'
    when ALLJP then imgname = 'bg_alljp.png'
    end
    @bg_img = Image.load("image/game_bg.png")
    @start = Image.load("image/kaishi.png")
    @img_shimane = Image.load("image/shimane.png")
    @img_enemy = Image.load("image/"+imgname)
    @tiji   = Image.load("image/tiji.png")
    @mayor = Mayor.new #�s��
    @citizens = []#�s������
    
    @item_img = Image.load("./image/fall_item/kani.png").setColorKey([0, 255, 0])
    @item_img2 = Image.load("./image/fall_item/yamata.png").setColorKey([0, 255, 0]) # i_okane.png, i_shijimi.png��ǉ�������.
    @item_img3 = Image.load("./image/fall_item/rakuda.png").setColorKey([0, 255, 0])
    @items1 = []#�����̃A�C�e���Q
    @items2 = []#�G���̃A�C�e���Q
    @bullet = nil #�e��
    
    @a = 0
    @start_x = 800
    @start_y = 0

    #�X�v���C�g�N���X�̃I�u�W�F�N�g��ݒ�i�{�^���A�[���N���b�N�p�|�C���^�j
    @img_next = Sprite.new(275,250, Image.load(File.expand_path("../../image/next.png", __FILE__)))
    @img_end = Sprite.new(275,450, Image.load(File.expand_path("../../image/end.png", __FILE__)))
    @img_title = Sprite.new(275,350, Image.load(File.expand_path("../../image/img_title.png", __FILE__)))
    x, y = Input.mousePosX, Input.mousePosY if Input.mouseDown?(M_LBUTTON) 
    @pt = Sprite.new(x,y, Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))
    @citizens << Citizen.new(40, true)
    @citizens << Citizen.new(100, true)
    @citizens << Citizen.new(150, true)
    @citizens << Citizen.new(255, true)
    @citizens << Citizen.new(460, false)
    @citizens << Citizen.new(500, false)
    @citizens << Citizen.new(600, false)
    @citizens << Citizen.new(680, false)
    
    Item.resetpoint
    
  end

  # �o���A�C�e����z��ɒǉ�
  def add_item
    item_array_size = 12
    
    if (@items1.size <= item_array_size) and (0 < (rand(100.0)+1.0).abs and (rand(100.0)+1.0).abs < 1.5)
      x_origin = (25..375).to_a.shuffle.first
      y_origin = 15
      
      #�m���ɉ������A�C�e������
      posarr = [40,40,20]
      flag = rand(posarr.inject{|sum, n| sum + n })
      sum = 0.0
      count = 1
      
      #�A�C�e������
      posarr.each do |e|  
        sum += e
        if flag < sum then
          break
        end
        count += 1
      end
      tmp = nil
      case count
      when 1 then tmp = Shijimi.new(x_origin,y_origin)
      when 2 then tmp = Money.new(x_origin,y_origin)
      else tmp = Orochi.new(x_origin,y_origin)
      end
      
      @items1 << tmp
    end	
    
    if (@items2.size <= item_array_size) and (0 < (rand(100.0)+1.0).abs and (rand(100.0)+1.0).abs < 1.5)
      x_origin = (475..(Window.width - 25)).to_a.shuffle.first
      y_origin = 15
      
      #�m���ɉ������A�C�e������
      posarr = [40,40,20]
      flag = rand(posarr.inject{|sum, n| sum + n })
      sum = 0.0
      count = 1
      
      #�A�C�e������
      posarr.each do |e|  
        sum += e
        if flag < sum then
          break
        end
        count += 1
      end
      tmp = nil
      case count
      when 1 then tmp = Pear.new(x_origin,y_origin)
      when 2 then tmp = Crab.new(x_origin,y_origin)
      else tmp = Camel.new(x_origin,y_origin)
      end
      @items2 << tmp
    end	
  end

  #�[���|�C���^���N���b�N��Ɉړ�
  def update(a)
    @pt.x, @pt.y = Input.mousePosX, Input.mousePosY
    if a == 1
      @img_next.draw
      @img_end.draw
      @img_title.draw
    end
    @start_x = @start_x -20 if @start_x > -800
  end

  def play
    #ESC�Ńg�b�v�֖߂�
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE) 
    
    #�w�i�Ȃǂ̕`��
    Window.draw(0, 0, @bg_img)
    Window.draw(25,25, @img_shimane)
    Window.draw(450, 25, @img_enemy)
    
    #�A�C�e���ǉ�
    self.add_item

    #�ʂ��΂�����
    @bullets = [Bullet.new(@mayor.x, @mayor.y, 0.0, Window.height,0.0, Window.width/2)] if Input.mouseDown?(M_LBUTTON)
    
    #���f���j���[�\������
    @a = 1 if Input.keyDown?(K_Y) 
    self.update(@a)
    
    #�R���e�B�j���[��END�{�^���A�[���|�C���^�̕\��
    @pt.draw
    Window.draw(@start_x,@start_y,@start)
    
    #�{�^�������i���̉�ʂւ̑J�ځj
    if Input.mouseDown?(M_LBUTTON) then
      # ���f���j���[���o�Ă��鎞�̃}�E�X�N���b�N�C�x���g
      Scene.set_scene(:game) unless @pt.check([@img_next]).empty?
      Scene.finish unless @pt.check(@img_end).empty?
      Scene.set_scene(:title) unless @pt.check([@img_title]).empty?
      
      # �ʏ�̃}�E�X�N���b�N�C�x���g(�ʐ���)
      @bullets = [Bullet.new(@mayor.x, @mayor.y, 0.0, Window.height,0.0, Window.width/2)] if Input.mouseDown?(M_LBUTTON) 
    end
    
    #�ʂƃA�C�e���̏Փ˔���
    Sprite.check(@bullets, @items1)
    Sprite.check(@bullets, @items2)
    
    #�A�C�e���Ǝs���̏Փ˔���
    Sprite.check(@items1, @citizens)
    Sprite.check(@items2, @citizens)
    
    #�|�C���g�`��
    Window.drawFont(50,50, Item.get_friendpoint.to_s + "���l", Font.new(24))
    
    #�A�b�v�f�[�g�A�h���[�A�N���A
    Sprite.update([@items1, @item2, @mayor, @bullets, @citizens])
    Sprite.draw([@items1, @item2, @mayor, @bullets])
    Sprite.clean([@items1,@items2,@bullets])
    
  end
end