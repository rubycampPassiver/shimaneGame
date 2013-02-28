class Title
  def initialize
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
    
    #�}�E�X�N���b�N�C�x���g
    if Input.mouseDown?(M_LBUTTON) then
      Scene.set_scene(:chugoku) unless @pt.check(@img_start).empty?#�X�^�[�g
      Scene.set_scene(:level) unless @pt.check(@img_level).empty?#���x���I��
      Scene.set_finish(true) unless @pt.check(@img_end).empty?#�I��
      
      #[!]�����I�ɋʂ��Ăяo���Ă��܂�
      #      @bullet = Bullet.new(Window.width/2, Window.height)
		end
    
    #[!]�����I�ɋʂ�`�悵�Ă��܂�
    #    Sprite.draw(@bullet)
    #    Sprite.update(@bullet)
    #    Sprite.clean(@bullet)
  end
end
