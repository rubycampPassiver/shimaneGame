#coding: SJIS

class Game

  CHUGOKU = 1
  WESTJP = 2
  ALLJP = 3
  
  #�f�t�H���g�R���X�g���N�^
  def initialize(modeint)
    
    #�������[�h�ɍ��킹�Ĕw�i��ύX
    imgname = ''
    case modeint
      when CHUGOKU then imgname = 'bg_chugoku.png'
      when WESTJP then imgname = 'bg_westjp.png'
      when ALLJP then imgname = 'bg_alljp.png'
    end
    @bg_img = Image.load("image/game_bg.png") #��Ԕw�i�̉摜
    @start = Image.load("image/kaishi.png") #�J�n�p�A�j���摜
    @img_shimane = Image.load("image/shimane.png") #�w�i�i�����j
    @img_enemy = Image.load("image/"+imgname) #�w�i�i���茧�j
    @tiji   = Image.load("image/tiji.png") #�m��
    @mayor = Mayor.new #����
    @bullet = nil #
    @citizen   = Image.load("image/citizen.png") #�s��
    @item_img = Image.load("./image/fall_item/kani.png").setColorKey([0, 255, 0]) #�A�C�e���i�J�j�j
    @item_img2 = Image.load("./image/fall_item/yamata.png").setColorKey([0, 255, 0]) #�A�C�e���i��܂��̂��낿�j
    @item_img3 = Image.load("./image/fall_item/rakuda.png").setColorKey([0, 255, 0]) #�A�C�e���i�炭���j
    @items1 = [] #�A�C�e���Q1
    @items2 = [] #�A�C�e���Q2
    
    @a = 0
    @start_x = 800
    @start_y = 0

    #�X�v���C�g�N���X�̃I�u�W�F�N�g��ݒ�i�{�^���A�[���N���b�N�p�|�C���^�j
    @img_next = Sprite.new(275,250, Image.load(File.expand_path("../../image/next.png", __FILE__)))
    @img_end = Sprite.new(275,450, Image.load(File.expand_path("../../image/end.png", __FILE__)))
    @img_title = Sprite.new(275,350, Image.load(File.expand_path("../../image/img_title.png", __FILE__)))
    x, y = Input.mousePosX, Input.mousePosY if Input.mouseDown?(M_LBUTTON) 
    @pt = Sprite.new(x,y, Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))
    
  end

  # �o���A�C�e����z��ɒǉ�
  def add_item
    item_array_size = 12
    
    if (@items1.size <= item_array_size) and (0 < (rand(100.0)+1.0).abs and (rand(100.0)+1.0).abs < 1.5)
      x_origin = (25..375).to_a.shuffle.first
      y_origin = 15
      case rand(4)
      when 3 then tmp = Crab.new(x_origin,y_origin)
      when 2 then tmp = Camel.new(x_origin,y_origin)
      else tmp = Orochi.new(x_origin,y_origin)
      end
      @items1 << tmp
    end	
    
    if (@items2.size <= item_array_size) and (0 < (rand(100.0)+1.0).abs and (rand(100.0)+1.0).abs < 1.5)
      x_origin = (475..(Window.width - 25)).to_a.shuffle.first
      y_origin = 15
      case rand(4)
      when 3 then @items2 << Crab.new(x_origin, y_origin)
      when 2 then @items2 << Camel.new(x_origin, y_origin)
      else @items2 << Orochi.new(x_origin, y_origin)
      end	
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
    Window.draw(0, 0, @bg_img)
    Window.draw(25,25, @img_shimane)
    Window.draw(450, 25, @img_enemy)
    Window.draw( 31,456,@citizen)
    Window.draw(255,456,@citizen)
    Window.draw(456,456,@citizen)
    Window.draw(680,456,@citizen)
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE) #ESC�Ńg�b�v�֖߂�
    self.add_item #�A�C�e���ǉ�
    
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
    #�A�C�e���Ɛl�̏Փ˔���
    Sprite.check(@items1, @citizen)
    Sprite.check(@items2, @citizen)
    
    Sprite.update([@items1, @item2, @mayor, @bullets])
    Sprite.draw([@items1, @item2, @mayor, @bullets])
    Sprite.clean([@items1,@items2,@bullets])

    
  end
end