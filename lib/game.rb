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
    @bg_img = Image.load("image/game_bg.png")
	@start = Image.load("image/kaishi.png")
    @img_shimane = Image.load("image/shimane.png")
    @img_enemy = Image.load("image/"+imgname)
    @tiji   = Image.load("image/tiji.png")
    @mayor = Mayor.new #����
    @bullet = nil #
    @citizen   = Image.load("image/citizen.png") #�s��
    
	@item_img = Image.load("./image/fall_item/kani.png").setColorKey([0, 255, 0])
	@item_img2 = Image.load("./image/fall_item/yamata.png").setColorKey([0, 255, 0]) # i_okane.png, i_shijimi.png��ǉ�������.
	@item_img3 = Image.load("./image/fall_item/rakuda.png").setColorKey([0, 255, 0])
  #  @citizen   = Image.load("image/citizen.png") #���̉摜�̓N���X�ɕύX�����̂ŕs�v.
	@items1 = []
	@items2 = []

	if Input.mouseDown?(M_LBUTTON) then
		x = Input.mousePosX
		y = Input.mousePosY
	end
	@a = 0
	@start_x = 800
	@start_y = 0

    #�X�v���C�g�N���X�̃I�u�W�F�N�g��ݒ�i�{�^���A�[���N���b�N�p�|�C���^�j
    @img_next = Sprite.new(275,250, Image.load(File.expand_path("../../image/next.png", __FILE__)))
    @img_end = Sprite.new(275,450, Image.load(File.expand_path("../../image/end.png", __FILE__)))
    @img_title = Sprite.new(275,350, Image.load(File.expand_path("../../image/img_title.png", __FILE__)))
    x, y = Input.mousePosX, Input.mousePosY if Input.mouseDown?(M_LBUTTON) 
    @pt = Sprite.new(x,y, Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))

    @citizen1 = Citizen.new(40, true)
    @citizen2 = Citizen.new(255, true)
    @citizen3 = Citizen.new(460, false)
    @citizen4 = Citizen.new(680, false)
  end

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
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    Sprite.update([@items1, @item2, @mayor, @bullet])
    Sprite.draw([@items1, @item2, @mayor, @bullet])
    Sprite.clean([@items1,@items2,@bullets])
    Window.draw(0, 0, @bg_img)
    Window.draw(25,25, @img_shimane)
    Window.draw(450, 25, @img_enemy)

    self.add_item


    @citizen1.update
    @citizen2.update
    @citizen3.update
    @citizen4.update


    #���i���j���[�\������
    @a = 1 if Input.keyDown?(K_Y)

    #�ʂ��΂�����
    @bullets = [Bullet.new(@mayor.x, @mayor.y, 0.0, Window.height,0.0, Window.width/2)] if Input.mouseDown?(M_LBUTTON)
    
    #�R���e�B�j���[��END�{�^���A�[���|�C���^�̕\��
    self.update(@a)
    @pt.draw
    Window.draw(@start_x,@start_y,@start)

    #�{�^�������i���̉�ʂւ̑J�ځj
    if Input.mouseDown?(M_LBUTTON) then
      Scene.set_scene(:game) unless @pt.check([@img_next]).empty?
      Scene.finish unless @pt.check(@img_end).empty?
      Scene.set_scene(:title) unless @pt.check([@img_title]).empty?
    end
    
  end
end