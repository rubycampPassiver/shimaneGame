class Title
  def initialize
		#���N���b�N���̂ݍ��W���擾
#		if Input.mouseDown?(M_LBUTTON) then
#      x = Input.mousePosX
#      y = Input.mousePosY
#		end
    #�I�u�W�F�N�g�̓ǂݍ���
    @bg =  Image.load(File.expand_path("../../image/title.png", __FILE__))#�o�b�N�O���E���h�摜
    @img_start = Sprite.new(275,150, Image.load(File.expand_path("../../image/start.png", __FILE__)))#�{�^���i�X�^�[�g�j�̕\��
    @img_level = Sprite.new(275,300, Image.load(File.expand_path("../../image/level.png", __FILE__)))#�{�^���i���x���I���j�̕\��
    @img_end = Sprite.new(275,450, Image.load(File.expand_path("../../image/end.png", __FILE__)))#�{�^���i�I���j�̕\��
    @pt = Sprite.new(0,0, Image.load(File.expand_path("../../image/pt_1.png", __FILE__)))#�[���N���b�N�p�̏����ȃs�N�Z���̕\��
  end
  
  def update
    #�[���|�C���^���N���b�N��Ɉړ�
    @pt.x = Input.mousePosX
    @pt.y = Input.mousePosY
  end
  
  def play
    
    #�[���|�C���^�̍��W���A�b�v�f�[�g
    self.update
    @pt.draw
    
    #�I�u�W�F�N�g�̕`��
    Window.draw(0, 0, @bg)#�o�b�N�O���E���h
    @img_start.draw
    @img_level.draw
    @img_end.draw 
#   @pt.draw
#   Sprite.draw(@pt)#
    
    #�}�E�X�N���b�N�C�x���g
    if Input.mouseDown?(M_LBUTTON) then
      puts "hit"
      #�V�[���J�ڂ̏���
      Scene.set_scene(:tottori) unless @pt.check(@img_start).empty?
      Scene.set_scene(:level) unless @pt.check(@img_level).empty?
      Scene.finish unless @pt.check(@img_end).empty?
		end

    
	
  end

end
